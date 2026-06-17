namespace demo10
{
    partial class AuthForm
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            lblError = new Label();
            btnEnter = new Button();
            checkBoxCapcha = new CheckBox();
            txtLogin = new TextBox();
            textBox1 = new TextBox();
            SuspendLayout();
            // 
            // lblError
            // 
            lblError.Dock = DockStyle.Top;
            lblError.Location = new Point(0, 0);
            lblError.Name = "lblError";
            lblError.Size = new Size(800, 20);
            lblError.TabIndex = 0;
            lblError.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // btnEnter
            // 
            btnEnter.Anchor = AnchorStyles.None;
            btnEnter.AutoSize = true;
            btnEnter.Location = new Point(360, 255);
            btnEnter.Name = "btnEnter";
            btnEnter.Size = new Size(94, 30);
            btnEnter.TabIndex = 1;
            btnEnter.Text = "Войти";
            btnEnter.UseVisualStyleBackColor = true;
            btnEnter.Click += btnEnter_Click;
            // 
            // checkBoxCapcha
            // 
            checkBoxCapcha.Anchor = AnchorStyles.Left | AnchorStyles.Right;
            checkBoxCapcha.AutoSize = true;
            checkBoxCapcha.Location = new Point(360, 317);
            checkBoxCapcha.Name = "checkBoxCapcha";
            checkBoxCapcha.Size = new Size(107, 24);
            checkBoxCapcha.TabIndex = 2;
            checkBoxCapcha.Text = "Я не робот";
            checkBoxCapcha.UseVisualStyleBackColor = true;
            checkBoxCapcha.CheckedChanged += checkBoxCapcha_CheckedChanged;
            // 
            // txtLogin
            // 
            txtLogin.Anchor = AnchorStyles.Left | AnchorStyles.Right;
            txtLogin.Location = new Point(296, 126);
            txtLogin.Name = "txtLogin";
            txtLogin.Size = new Size(216, 27);
            txtLogin.TabIndex = 3;
            // 
            // textBox1
            // 
            textBox1.Anchor = AnchorStyles.Left | AnchorStyles.Right;
            textBox1.Location = new Point(296, 195);
            textBox1.Name = "textBox1";
            textBox1.Size = new Size(216, 27);
            textBox1.TabIndex = 4;
            // 
            // AuthForm
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(textBox1);
            Controls.Add(txtLogin);
            Controls.Add(checkBoxCapcha);
            Controls.Add(btnEnter);
            Controls.Add(lblError);
            MinimumSize = new Size(700, 400);
            Name = "AuthForm";
            Text = "Авторизация";
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label lblError;
        private Button btnEnter;
        private CheckBox checkBoxCapcha;
        private TextBox txtLogin;
        private TextBox textBox1;
    }
}
