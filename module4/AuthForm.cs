using Npgsql;

namespace demo10
{
    public partial class AuthForm : Form
    {
        string connectionString = "Host=localhost;Port=5432;Database=demo2;Username=postgres;Password=12345678";

        string login = "";
        int tryies = 3;
        public AuthForm()
        {
            InitializeComponent();
        }
        private User Auth(string login, string password)
        {
            using var con = new NpgsqlConnection(connectionString);
            using var command = new NpgsqlCommand("select id, login, password, role, is_active from users where login=@login", con);
            con.Open();
            command.Parameters.AddWithValue("@login", login);
            using var reader = command.ExecuteReader();
            if (reader.Read() && reader.GetString(2)==password)
            {
                return new User
                {
                    id = reader.GetInt32(0),
                    login = reader.GetString(1),
                    password = reader.GetString(2),
                    role = reader.GetString(3),
                    is_active = reader.GetBoolean(4)
                };
            }
            return null;
        }

        private void btnEnter_Click(object sender, EventArgs e)
        {
            string login = txtLogin.Text;
            if (string.IsNullOrEmpty(login))
            {
                lblError.Text = "Введите логин";
                return;
            }
            string password = textBox1.Text;
            if (string.IsNullOrEmpty(password))
            {
                lblError.Text = "Введите пароль";
                return;
            }
            if (isBlocked(login))
            {
                lblError.Text = "Вы заблокированы. Обратитесь к администратору";
                return;
            }
            if (!checkBoxCapcha.Checked)
            {
                lblError.Text = "Капча не пройдена";
                return;
            }
            User user = Auth(login, password);
            if (user != null && user.is_active)
            {
                lblError.Text = "Вы успешно авторизовались";
                if (user.role == "admin")
                {
                    AdminForm adminForm = new AdminForm();
                    adminForm.Show();
                    this.Hide();
                }
            }
            else
            {
                if (tryies <= 0)
                {
                    Block(login);
                    lblError.Text = "Вы заблокированы. Обратитесь к администратору";
                }
                else
                {
                    tryies--;
                    lblError.Text = "Неправильный логин или пароль";
                }
            }
        }
        void Block(string login)
        {
            using var con = new NpgsqlConnection(connectionString);
            using var command = new NpgsqlCommand("update users set is_active=false where login=@login", con);
            con.Open();
            command.Parameters.AddWithValue("@login", login);
            command.ExecuteNonQuery();
        }
        bool isBlocked(string login)
        {
            using var con = new NpgsqlConnection(connectionString);
            using var command = new NpgsqlCommand("select is_active from users where login=@login", con);
            con.Open();
            command.Parameters.AddWithValue("@login", login);
            return !Convert.ToBoolean(command.ExecuteScalar());
        }

        private void checkBoxCapcha_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBoxCapcha.Checked)
            {
                using (CapchaForm capcha = new CapchaForm(login))
                {
                    if (capcha.ShowDialog() == DialogResult.OK)
                    {
                        lblError.Text = "Капча пройдена";
                        checkBoxCapcha.Checked = true;
                    }
                    else
                    {
                        checkBoxCapcha.Checked = false;
                        if (capcha.isBlocked)
                            lblError.Text = "Вы заблокированы";
                        else
                            lblError.Text = "Капча не пройдена";
                    }
                }
            }
        }
    }
}
