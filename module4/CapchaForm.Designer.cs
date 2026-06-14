namespace demo
{
    partial class CapchaForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
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
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            txtCapcha = new TextBox();
            btnCapcha = new Button();
            lblCapcha = new Label();
            trackBarCapcha = new TrackBar();
            pictureBoxCapcha = new PictureBox();
            ((System.ComponentModel.ISupportInitialize)trackBarCapcha).BeginInit();
            ((System.ComponentModel.ISupportInitialize)pictureBoxCapcha).BeginInit();
            SuspendLayout();
            // 
            // txtCapcha
            // 
            txtCapcha.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
            txtCapcha.BorderStyle = BorderStyle.FixedSingle;
            txtCapcha.Location = new Point(83, 12);
            txtCapcha.Name = "txtCapcha";
            txtCapcha.Size = new Size(274, 27);
            txtCapcha.TabIndex = 13;
            txtCapcha.Text = "Соберите капчу с помощью ползунка";
            txtCapcha.TextAlign = HorizontalAlignment.Center;
            // 
            // btnCapcha
            // 
            btnCapcha.Anchor = AnchorStyles.Bottom;
            btnCapcha.Location = new Point(166, 441);
            btnCapcha.Name = "btnCapcha";
            btnCapcha.Size = new Size(94, 29);
            btnCapcha.TabIndex = 12;
            btnCapcha.Text = "Проверить";
            btnCapcha.UseVisualStyleBackColor = true;
            // 
            // lblCapcha
            // 
            lblCapcha.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
            lblCapcha.AutoSize = true;
            lblCapcha.Location = new Point(29, 41);
            lblCapcha.Name = "lblCapcha";
            lblCapcha.Size = new Size(0, 20);
            lblCapcha.TabIndex = 11;
            // 
            // trackBarCapcha
            // 
            trackBarCapcha.Anchor = AnchorStyles.Left | AnchorStyles.Right;
            trackBarCapcha.Location = new Point(112, 379);
            trackBarCapcha.Name = "trackBarCapcha";
            trackBarCapcha.Size = new Size(208, 56);
            trackBarCapcha.TabIndex = 10;
            // 
            // pictureBoxCapcha
            // 
            pictureBoxCapcha.Anchor = AnchorStyles.None;
            pictureBoxCapcha.Location = new Point(63, 64);
            pictureBoxCapcha.Name = "pictureBoxCapcha";
            pictureBoxCapcha.Size = new Size(311, 309);
            pictureBoxCapcha.SizeMode = PictureBoxSizeMode.StretchImage;
            pictureBoxCapcha.TabIndex = 9;
            pictureBoxCapcha.TabStop = false;
            // 
            // CapchaForm
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(429, 482);
            Controls.Add(txtCapcha);
            Controls.Add(btnCapcha);
            Controls.Add(lblCapcha);
            Controls.Add(trackBarCapcha);
            Controls.Add(pictureBoxCapcha);
            MinimumSize = new Size(447, 529);
            Name = "CapchaForm";
            Text = "Capcha";
            ((System.ComponentModel.ISupportInitialize)trackBarCapcha).EndInit();
            ((System.ComponentModel.ISupportInitialize)pictureBoxCapcha).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private TextBox txtCapcha;
        private Button btnCapcha;
        private Label lblCapcha;
        private TrackBar trackBarCapcha;
        private PictureBox pictureBoxCapcha;
    }
}