using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace demo
{
    public partial class AdminForm : Form
    {
        string connectionString = "Host=localhost;Port=5432;Database=demo2;Username=postgres;password=12345678;";
        string sql = @"select id, login, password, role, is_active from program_user order by id";
        private NpgsqlDataAdapter dataAdapter;
        private DataTable dataTable;
        NpgsqlCommandBuilder commandBuilder;
        public AdminForm()
        {
            InitializeComponent();
            dataGridViewUsers.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            LoadUsers();
        }

        public void LoadUsers()
        {
            NpgsqlConnection connection = new NpgsqlConnection(connectionString);
            try
            {
                connection.Open();
                dataAdapter = new NpgsqlDataAdapter(sql, connection);
                commandBuilder = new NpgsqlCommandBuilder(dataAdapter);
                dataTable = new DataTable();
                dataAdapter.Fill(dataTable);
                dataGridViewUsers.DataSource = dataTable;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: ", ex.Message);
            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            dataTable.EndInit();
            dataAdapter.Update(dataTable);
            dataTable.AcceptChanges();
            MessageBox.Show("Все изменения применены.");
        }

        private void btnAddUser_Click(object sender, EventArgs e)
        {
            string login = Microsoft.VisualBasic.Interaction.InputBox("Введите логин пользователя");

            if (string.IsNullOrEmpty(login))
            {
                MessageBox.Show("Логин не может быть пустым!");
                return;
            }
            if (userExists(login))
            {
                MessageBox.Show("Пользователь с таким логином уже существует.");
                return;
            }

            DataRow newRow = dataTable.NewRow();
            newRow["login"] = login;
            newRow["password"] = "password";
            newRow["role"] = "user";
            newRow["is_active"] = true;

            dataTable.Rows.Add(newRow);
            dataTable.EndInit();
            dataAdapter.Update(dataTable);
            dataTable.AcceptChanges();
        }

        private bool userExists(string login)
        {
            using (NpgsqlConnection connection = new NpgsqlConnection(connectionString))
            {
                connection.Open();
                string request = "select count(*) from program_user where login = @login";
                using (NpgsqlCommand command = new NpgsqlCommand(request, connection))
                {
                    command.Parameters.AddWithValue("@login", login);
                    return Convert.ToInt32(command.ExecuteScalar()) > 0;
                }
            }
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            this.Hide();
            AuthForm authForm = new AuthForm();
            authForm.Show();
        }
    }
}
