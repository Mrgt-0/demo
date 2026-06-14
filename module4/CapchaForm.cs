using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace demo
{
    public partial class CapchaForm : Form
    {
        private Image[] parts;
        private int capchaCorrectPosition = 3;
        public bool IsBlocked = false; 
        private int countTry = 0;
        private string _login; 

        public CapchaForm(string login)
        {
            InitializeComponent();
            _login = login;
            LoadImageParts();

            trackBarCapcha.Minimum = 0;
            trackBarCapcha.Maximum = 3;
            trackBarCapcha.Value = 0;

            trackBarCapcha.Scroll += (s, e) =>
            {
                UpdatePicture(pictureBoxCapcha, trackBarCapcha.Value);
                if (trackBarCapcha.Value == capchaCorrectPosition)
                {
                    lblCapcha.Text = "Картинка собрана правильно! Нажмите 'Проверить'";
                    lblCapcha.ForeColor = Color.Green;
                }
                else
                {
                    lblCapcha.Text = $"Перемещайте ползунок";
                    lblCapcha.ForeColor = Color.Red;
                }
            };

            btnCapcha.Click += (s, e) =>
            {
                if (trackBarCapcha.Value == capchaCorrectPosition)
                {
                    countTry = 0;
                    MessageBox.Show("Правильно! Капча пройдена.", "Успех",
                        MessageBoxButtons.OK, MessageBoxIcon.Information);
                    this.DialogResult = DialogResult.OK;
                    this.Close();
                }
                else
                {
                    countTry++;
                    int remaining = 3 - countTry;

                    if (countTry >= 3)
                    {
                        // Блокируем пользователя в БД
                        BlockUserInDatabase();
                        IsBlocked = true;
                        MessageBox.Show("Вы 3 раза неверно собрали капчу! Пользователь заблокирован.",
                            "Блокировка", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        this.DialogResult = DialogResult.Cancel;
                        this.Close();
                    }
                    else
                    {
                        MessageBox.Show($"Картинка собрана неправильно! Осталось попыток: {remaining}",
                            "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
            };

            this.Controls.Add(pictureBoxCapcha);
            this.Controls.Add(trackBarCapcha);
            this.Controls.Add(lblCapcha);
            this.Controls.Add(btnCapcha);

            UpdatePicture(pictureBoxCapcha, 0);
        }
        private void BlockUserInDatabase()
        {
            string connectionString = "Host=localhost;Port=5432;Database=demo2;Username=postgres;password=12345678;";

            using (NpgsqlConnection conn = new NpgsqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string sql = "update program_user set is_active = false where login = @login";
                    using (NpgsqlCommand cmd = new NpgsqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@login", _login);
                        cmd.ExecuteNonQuery();
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Ошибка блокировки: " + ex.Message);
                }
            }
        }
        public void LoadImageParts()
        {
            parts = new Image[4];
            Image[] opiginal = new Image[4];
            opiginal[0] = Image.FromFile("D:\\мусор\\demo\\images\\1.png");
            opiginal[1] = Image.FromFile("D:\\мусор\\demo\\images\\2.png");
            opiginal[2] = Image.FromFile("D:\\мусор\\demo\\images\\3.png");
            opiginal[3] = Image.FromFile("D:\\мусор\\demo\\images\\4.png");

            parts[0] = opiginal[1];
            parts[1] = opiginal[2];
            parts[2] = opiginal[3];
            parts[3] = opiginal[0];

        }
        private void UpdatePicture(PictureBox pic, int position)
        {
            Bitmap result = new Bitmap(350, 350);
            using (Graphics g = Graphics.FromImage(result))
            {
                int w = 175, h = 175;

                // Циклический сдвиг частей
                for (int i = 0; i < 4; i++)
                {
                    int partIndex = (i + position) % 4;
                    int x = (i % 2) * w;
                    int y = (i / 2) * h;
                    g.DrawImage(parts[partIndex], x, y, w, h);
                }
            }
            pic.Image = result;
        }
    }
}
