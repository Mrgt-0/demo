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
    public partial class CapchaForm : Form
    {
        string connectionString = "Host=localhost;Port=5432;Database=demo2;Username=postgres;Password=12345678";
        Image[] parts;
        int correctPos = 3;
        public bool isBlocked;
        int tryies = 3;
        string login;

        public CapchaForm(string login)
        {
            this.login = login;
            InitializeComponent();
            LoadPicture();
            trackBar1.Value = 0;
            trackBar1.Maximum = 4;
            UpdatePicture(pictureBox, trackBar1.Value);
        }

        void LoadPicture()
        {
            parts = new Image[4];
            Image[] original=new Image[4];
            original[0] = Image.FromFile("D:\\мусор\\demo10\\images\\1.png");
            original[1] = Image.FromFile("D:\\мусор\\demo10\\images\\2.png");
            original[2] = Image.FromFile("D:\\мусор\\demo10\\images\\3.png");
            original[3] = Image.FromFile("D:\\мусор\\demo10\\images\\4.png");

            parts[0] = original[1];
            parts[1] = original[2];
            parts[2] = original[3];
            parts[3] = original[0];
        }
        void UpdatePicture(PictureBox pictureBox, int pos)
        {
            Bitmap bitmap = new Bitmap(350, 350);
            using(Graphics graphics = Graphics.FromImage(bitmap))
            {
                int w = 175, h = 175;
                for (int i = 0; i < 4; i++)
                {
                    int indexPos = (pos + i) % 4;
                    int x = (i % 2) * w;
                    int y = (i / 2) * h;

                    graphics.DrawImage(parts[indexPos], x, y, w, h);

                }
                pictureBox.Image = bitmap;
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (trackBar1.Value == correctPos)
            {
                this.DialogResult= DialogResult.OK;
                this.Hide();
            }
            else
            {
                if (tryies <= 0)
                {
                    Block(login);
                    isBlocked = true;
                    this.Hide();
                }
                else
                {
                    tryies--;
                    MessageBox.Show("Капча не собрана");
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

        private void trackBar1_Scroll(object sender, EventArgs e)
        {
            UpdatePicture(pictureBox, trackBar1.Value);
            lblError.Text = trackBar1.Value == correctPos ? "Правильно" : "Передвигайте ползунок";
        }
    }
}
