using Microsoft.VisualBasic.Logging;
using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace demo10
{
    public partial class AdminForm : Form
    {
        string connectionString = "Host=localhost;Port=5432;Database=demo2;Username=postgres;Password=12345678";
        NpgsqlConnection connection;
        NpgsqlDataAdapter dataAdapter;
        DataTable dataTable;
        public AdminForm()
        {
            InitializeComponent();
            LoadUsers();
        }
        void LoadUsers()
        {
            connection = new NpgsqlConnection(connectionString);
            connection.Open();
            dataAdapter = new NpgsqlDataAdapter("select id, login, password, role, is_active from users order by id", connection);
            new NpgsqlCommandBuilder(dataAdapter);
            dataTable = new DataTable();
            dataAdapter.Fill(dataTable);
            dataGridViewUsers.DataSource = dataTable;
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            string login = Microsoft.VisualBasic.Interaction.InputBox("Логин");
            if (string.IsNullOrEmpty(login))
            {
                MessageBox.Show("Введите логин");
                return;
            }
            if (isExists(login))
            {
                MessageBox.Show("Пользователь с таким логином уже существует");
                return;
            }
            var row = dataTable.NewRow();
            row["login"] = login;
            row["password"] = "password";
            row["role"] = "user";
            row["is_active"] = true;
            dataTable.Rows.Add(row);
            dataAdapter.Update(dataTable);
            dataTable.AcceptChanges();
            MessageBox.Show("Пользователь создан");
        }
        private bool isExists(string login)
        {
            connection = new NpgsqlConnection(connectionString);
            connection.Open();
            using NpgsqlCommand command = new NpgsqlCommand("select count(*) from users where login=@login", connection);
            command.Parameters.AddWithValue("login", login);
            return Convert.ToInt32(command.ExecuteScalar()) > 0;
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            dataAdapter.Update(dataTable);
            dataTable.AcceptChanges();
            MessageBox.Show("Изменения созранены");
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            AuthForm authForm = new AuthForm();
            authForm.Show();
            this.Close();
        }
    }
}
