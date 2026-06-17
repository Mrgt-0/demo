namespace demo10
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
            pictureBox = new PictureBox();
            trackBar1 = new TrackBar();
            button1 = new Button();
            lblError = new Label();
            ((System.ComponentModel.ISupportInitialize)pictureBox).BeginInit();
            ((System.ComponentModel.ISupportInitialize)trackBar1).BeginInit();
            SuspendLayout();
            // 
            // pictureBox
            // 
            pictureBox.Location = new Point(12, 36);
            pictureBox.Name = "pictureBox";
            pictureBox.Size = new Size(416, 306);
            pictureBox.TabIndex = 0;
            pictureBox.TabStop = false;
            // 
            // trackBar1
            // 
            trackBar1.Anchor = AnchorStyles.Left | AnchorStyles.Right;
            trackBar1.AutoSize = false;
            trackBar1.Location = new Point(46, 347);
            trackBar1.Name = "trackBar1";
            trackBar1.Size = new Size(346, 56);
            trackBar1.TabIndex = 1;
            trackBar1.Scroll += trackBar1_Scroll;
            // 
            // button1
            // 
            button1.Anchor = AnchorStyles.Left | AnchorStyles.Right;
            button1.Location = new Point(165, 409);
            button1.Name = "button1";
            button1.Size = new Size(94, 29);
            button1.TabIndex = 2;
            button1.Text = "Проверить";
            button1.UseVisualStyleBackColor = true;
            button1.Click += button1_Click;
            // 
            // lblError
            // 
            lblError.Dock = DockStyle.Top;
            lblError.Location = new Point(0, 0);
            lblError.Name = "lblError";
            lblError.Size = new Size(440, 25);
            lblError.TabIndex = 3;
            lblError.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // CapchaForm
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(440, 450);
            Controls.Add(lblError);
            Controls.Add(button1);
            Controls.Add(trackBar1);
            Controls.Add(pictureBox);
            MinimumSize = new Size(450, 490);
            Name = "CapchaForm";
            Text = "CapchaForm";
            ((System.ComponentModel.ISupportInitialize)pictureBox).EndInit();
            ((System.ComponentModel.ISupportInitialize)trackBar1).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private PictureBox pictureBox;
        private TrackBar trackBar1;
        private Button button1;
        private Label lblError;
    }
}