using Microsoft.VisualBasic.Logging;
using Npgsql;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.TrackBar;

namespace demo
{
    public partial class AuthForm : Form
    {
        string connectionString = "Host=localhost;Port=5432;Database=demo2;Username=postgres;password=12345678;";
        string sql = @"select id, login, password, role, is_active from program_user where login=@login";
        private int _passwordFailCount = 0; 
        private string _currentLogin = "";
        public AuthForm()
        {
            InitializeComponent();
            this.StartPosition = FormStartPosition.CenterScreen;
            lblError.Text = "Введите логин и пароль";
        }

        private void btnEnter_Click(object sender, EventArgs e)
        {
            string login = txtLogin.Text;
            string password = txtPassword.Text;

            if (string.IsNullOrEmpty(login))
            {
                lblError.Text = "Введите логин";
                return;
            }
            if (string.IsNullOrEmpty(password))
            {
                lblError.Text = "Введите пароль";
                return;
            }
            if (_currentLogin != login)
            {
                _passwordFailCount = 0;
                _currentLogin = login;
            }
            if (IsUserBlocked(login))
            {
                lblError.Text = "Вы заблокированы. Обратитесь к администратору";
                return;
            }
            if (!checkBoxCapcha.Checked)
            {
                lblError.Text = "Пройдите капчу!";
                return;
            }
            User user = AuthenticateUser(login, password);

            if (user != null && user.is_active)
            {
                _passwordFailCount = 0;
                lblError.Text = "Вы успешно авторизовались";

                if (user.role == "admin")
                {
                    this.Hide();
                    AdminForm adminForm = new AdminForm();
                    adminForm.Show();
                }
            }
            else if (user != null && !user.is_active)
            {
                lblError.Text = "Вы заблокированы. Обратитесь к администратору";
            }
            else
            {
                _passwordFailCount++;
                int remaining = 3 - _passwordFailCount;

                if (_passwordFailCount >= 3)
                {
                    BlockUser(login);
                    lblError.Text = "Вы 3 раза ввели неверный пароль! Пользователь заблокирован.";
                    txtLogin.Clear();
                    txtPassword.Clear();
                }
                else
                {
                    lblError.Text = $"Неверный логин или пароль! Осталось попыток: {remaining}";
                    txtPassword.Clear();
                }
                txtLogin.Focus();
                checkBoxCapcha.Checked = false;
            }
        }
        private bool IsUserBlocked(string login)
        {
            using (NpgsqlConnection conn = new NpgsqlConnection(connectionString))
            {
                conn.Open();
                string sql = "select is_active from program_user where login = @login";
                using (NpgsqlCommand cmd = new NpgsqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@login", login);
                    object result = cmd.ExecuteScalar();
                    return result != null && !Convert.ToBoolean(result);
                }
            }
        }
        private void BlockUser(string login)
        {
            using (NpgsqlConnection conn = new NpgsqlConnection(connectionString))
            {
                conn.Open();
                string sql = "update program_user set is_active = false where login = @login";
                using (NpgsqlCommand cmd = new NpgsqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@login", login);
                    cmd.ExecuteNonQuery();
                }
            }
        }
        public User AuthenticateUser(string login, string password)
        {
            using (NpgsqlConnection connection = new NpgsqlConnection(connectionString))
            using (NpgsqlCommand command = new NpgsqlCommand(sql, connection))
            {
                command.Parameters.AddWithValue("@login", login);
                try
                {
                    connection.Open();
                    using (NpgsqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string dbPassword = reader.GetString(2);
                            if (dbPassword == password)
                            {
                                return new User
                                {
                                    id = reader.GetInt32(0),
                                    login = reader.GetString(1),
                                    password = dbPassword,
                                    role = reader.GetString(3),
                                    is_active = reader.GetBoolean(4)
                                };
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Ошибка БД: " + ex.Message);
                }
                return null;
            }
        }
        //капча
        private void checkBoxCapcha_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBoxCapcha.Checked)
            {
                string login = txtLogin.Text;
                if (string.IsNullOrEmpty(login))
                {
                    MessageBox.Show("Сначала введите логин!");
                    checkBoxCapcha.Checked = false;
                    return;
                }

                using (CapchaForm capchaForm = new CapchaForm(login))
                {
                    if (capchaForm.ShowDialog() == DialogResult.OK)
                    {
                        checkBoxCapcha.Checked = true;
                        lblError.Text = "Капча пройдена";
                    }
                    else
                    {
                        checkBoxCapcha.Checked = false;
                        if (capchaForm.IsBlocked)
                        {
                            lblError.Text = "Вы заблокированы. Обратитесь к администратору";
                            btnEnter.Enabled = false;
                        }
                        else
                        {
                            lblError.Text = "Капча не пройдена";
                        }
                    }
                }
            }
        }
    }
}