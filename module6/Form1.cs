using System;
using System.Net.Http;
using System.Text.Json;
using System.Text.RegularExpressions;
using System.Windows.Forms;
using System.IO;
using DocumentFormat.OpenXml;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Wordprocessing;

namespace demo_6_module
{
    public partial class Form1 : Form
    {
        private readonly HttpClient _httpClient = new HttpClient();
        private string _testCasePath = @"D:\мусор\demo 6 module\ТестКейс.docx";
        private string _currentFullName = "";

        public Form1()
        {
            InitializeComponent();
        }

        private async void btnGetData_Click(object sender, EventArgs e)
        {
            try
            {
                string json = await _httpClient.GetStringAsync("http://127.0.0.1:4444/TransferSimulator/fullName");
                using JsonDocument doc = JsonDocument.Parse(json);
                string rawValue = doc.RootElement.GetProperty("value").GetString() ?? "";
                var names = rawValue.Split('&', StringSplitOptions.RemoveEmptyEntries);
                _currentFullName = names.Length > 0 ? names[0].Trim() : "";
                lblFIO.Text = _currentFullName;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка: " + ex.Message);
            }
        }

        private void btnValidate_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(_currentFullName))
            {
                MessageBox.Show("Сначала получите данные!");
                return;
            }

            bool hasInvalid = Regex.IsMatch(_currentFullName, @"[^\p{L}\s\-]");

            string displayMessage = hasInvalid ? "ФИО содержит запрещенные символы" : "ФИО корректно";
            string fileResult = hasInvalid ? "Не успешно" : "Успешно";

            lblValidateInfo.Text = displayMessage;
            lblValidateInfo.ForeColor = hasInvalid ? System.Drawing.Color.Red : System.Drawing.Color.Green;

            WriteResultToDocx("СпецСимвол1", fileResult);

            MessageBox.Show(displayMessage);
        }

        private void WriteResultToDocx(string bookmarkName, string result)
        {
            if (!File.Exists(_testCasePath))
            {
                MessageBox.Show("Файл ТестКейс.docx не найден!");
                return;
            }

            try
            {
                using (WordprocessingDocument document = WordprocessingDocument.Open(_testCasePath, true))
                {
                    var body = document.MainDocumentPart?.Document.Body;
                    if (body == null) return;

                    var bookmark = body.Descendants<BookmarkStart>().FirstOrDefault(b => b.Name == bookmarkName);
                    if (bookmark == null) return;

                    var next = bookmark.NextSibling();
                    while (next != null && !(next is BookmarkEnd))
                    {
                        var toRemove = next;
                        next = next.NextSibling();
                        if (toRemove is Run)
                            toRemove.Remove();
                    }

                    bookmark.InsertAfterSelf(new Run(new Text(result) { Space = SpaceProcessingModeValues.Preserve }));
                    document.MainDocumentPart!.Document.Save();
                }
            }
            catch(Exception ex) { 
                MessageBox.Show(ex.Message);
            }
        }

    }
}
