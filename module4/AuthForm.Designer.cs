namespace demo
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
            txtLogin = new TextBox();
            txtPassword = new TextBox();
            btnEnter = new Button();
            lblError = new Label();
            checkBoxCapcha = new CheckBox();
            SuspendLayout();
            // 
            // txtLogin
            // 
            txtLogin.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
            txtLogin.Location = new Point(311, 150);
            txtLogin.MinimumSize = new Size(30, 30);
            txtLogin.Name = "txtLogin";
            txtLogin.Size = new Size(208, 30);
            txtLogin.TabIndex = 0;
            // 
            // txtPassword
            // 
            txtPassword.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
            txtPassword.Location = new Point(311, 195);
            txtPassword.MinimumSize = new Size(30, 30);
            txtPassword.Name = "txtPassword";
            txtPassword.Size = new Size(208, 30);
            txtPassword.TabIndex = 1;
            // 
            // btnEnter
            // 
            btnEnter.Anchor = AnchorStyles.Bottom;
            btnEnter.AutoSizeMode = AutoSizeMode.GrowAndShrink;
            btnEnter.Location = new Point(371, 241);
            btnEnter.Name = "btnEnter";
            btnEnter.Size = new Size(94, 29);
            btnEnter.TabIndex = 2;
            btnEnter.Text = "Войти";
            btnEnter.UseVisualStyleBackColor = true;
            btnEnter.Click += btnEnter_Click;
            // 
            // lblError
            // 
            lblError.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
            lblError.Location = new Point(12, 72);
            lblError.MinimumSize = new Size(50, 50);
            lblError.Name = "lblError";
            lblError.Size = new Size(793, 66);
            lblError.TabIndex = 3;
            lblError.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // checkBoxCapcha
            // 
            checkBoxCapcha.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
            checkBoxCapcha.AutoSize = true;
            checkBoxCapcha.Location = new Point(364, 307);
            checkBoxCapcha.Name = "checkBoxCapcha";
            checkBoxCapcha.Size = new Size(107, 24);
            checkBoxCapcha.TabIndex = 4;
            checkBoxCapcha.Text = "Я не робот";
            checkBoxCapcha.TextAlign = ContentAlignment.MiddleCenter;
            checkBoxCapcha.UseVisualStyleBackColor = true;
            checkBoxCapcha.CheckedChanged += checkBoxCapcha_CheckedChanged;
            // 
            // AuthForm
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(817, 453);
            Controls.Add(checkBoxCapcha);
            Controls.Add(lblError);
            Controls.Add(btnEnter);
            Controls.Add(txtPassword);
            Controls.Add(txtLogin);
            KeyPreview = true;
            MinimumSize = new Size(800, 500);
            Name = "AuthForm";
            Text = "Авторизация";
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private TextBox txtLogin;
        private TextBox txtPassword;
        private Button btnEnter;
        private Label lblError;
        private CheckBox checkBoxCapcha;
    }
}
