namespace demo_6_module
{
    partial class Form1
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
            lblFIO = new Label();
            btnGetData = new Button();
            btnSendResult = new Button();
            lblValidateInfo = new Label();
            SuspendLayout();
            // 
            // lblFIO
            // 
            lblFIO.Location = new Point(305, 64);
            lblFIO.Name = "lblFIO";
            lblFIO.Size = new Size(295, 51);
            lblFIO.TabIndex = 0;
            // 
            // btnGetData
            // 
            btnGetData.Location = new Point(43, 64);
            btnGetData.Name = "btnGetData";
            btnGetData.Size = new Size(240, 51);
            btnGetData.TabIndex = 1;
            btnGetData.Text = "Получить данные";
            btnGetData.UseVisualStyleBackColor = true;
            btnGetData.Click += btnGetData_Click;
            // 
            // btnSendResult
            // 
            btnSendResult.Location = new Point(43, 161);
            btnSendResult.Name = "btnSendResult";
            btnSendResult.Size = new Size(240, 51);
            btnSendResult.TabIndex = 2;
            btnSendResult.Text = "Отправить результат теста";
            btnSendResult.UseVisualStyleBackColor = true;
            btnSendResult.Click += btnValidate_Click;
            // 
            // lblValidateInfo
            // 
            lblValidateInfo.Location = new Point(305, 161);
            lblValidateInfo.Name = "lblValidateInfo";
            lblValidateInfo.Size = new Size(295, 51);
            lblValidateInfo.TabIndex = 3;
            // 
            // Form1
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(626, 283);
            Controls.Add(lblValidateInfo);
            Controls.Add(btnSendResult);
            Controls.Add(btnGetData);
            Controls.Add(lblFIO);
            Name = "Form1";
            Tag = "Валидация данных";
            Text = "Валидация данных";
            ResumeLayout(false);
        }

        #endregion

        private Label lblFIO;
        private Button btnGetData;
        private Button btnSendResult;
        private Label lblValidateInfo;
    }
}
