using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;

/// <summary>
/// Summary description for UTIL
/// </summary>
public class UTIL
{
    public UTIL()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static void SendMailFast(string EmailFrom, string EmailTo, string Subject, string Body, string FromName, string email_id, string email_pass, string email_host)
    {
        // Gmail Address from where you send the mail
        // default test@ferya.info | pass Capsole1@ | Host mail.iris.arvixe.com | port 25

        // from source email to send
        string FromAddress = email_id;

        string FromPassword = email_pass;


        System.Net.Mail.MailMessage eMail = new System.Net.Mail.MailMessage();
        eMail.IsBodyHtml = true;
        eMail.Body = Body;
        eMail.From = new System.Net.Mail.MailAddress(EmailFrom, FromName);
        eMail.To.Add(EmailTo);
        eMail.Subject = Subject;
        //Attachment a = new Attachment("c:/DISCOVER_YOURSELF.pdf");
        // eMail.Attachments.Add(a);

        System.Net.Mail.SmtpClient SMTP = new System.Net.Mail.SmtpClient();

        SMTP.Credentials = new System.Net.NetworkCredential(FromAddress, FromPassword);
        SMTP.Host = email_host;
        SMTP.Send(eMail);
    }

    public static DateTime StringToDate(string s, bool Time = true)
    {
        //// 2015/11/01 09:10    m-d-y
        //string[] a = s.Split(' ');
        //a = a[0].Split('/');
        //int month = Int32.Parse(a[0]);
        //int day = Int32.Parse(a[1]);
        //int year = Int32.Parse(a[2]);
        //a = a[1].Split(':');
        //int hour = Int32.Parse(a[0]);
        //int min = Int32.Parse(a[1]);
        int month = Convert.ToInt32(s.Split('/')[0]);
        int day = Convert.ToInt32(s.Split('/')[1]);
        int year = Convert.ToInt32(s.Split('/')[2].Split(' ')[0]);


        if (Time)
        {
            int hour = Convert.ToInt32(s.Split('/')[2].Split(' ')[1].Split(':')[0]);
            int mins = Convert.ToInt32(s.Split('/')[2].Split(' ')[1].Split(':')[1]);
            //int second = Convert.ToInt32(s.Split('/')[2].Split(' ')[1].Split(':')[2]);
            return new DateTime(year, month, day, hour, mins, 0);
        }
        else
        {
            return new DateTime(year, month, day);
        }



        //return new DateTime(year, month, day,hour,mins,0);
    }
    public static string Encrypt(string toEncrypt, bool useHashing)
    {
        byte[] keyArray;
        byte[] toEncryptArray = UTF8Encoding.UTF8.GetBytes(toEncrypt);

        System.Configuration.AppSettingsReader settingsReader =
                                            new AppSettingsReader();
        // Get the key from config file

        string key = (string)settingsReader.GetValue("SecurityKey",
                                                         typeof(String));
        //System.Windows.Forms.MessageBox.Show(key);
        //If hashing use get hashcode regards to your key
        if (useHashing)
        {
            MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider();
            keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key));
            //Always release the resources and flush data
            // of the Cryptographic service provide. Best Practice

            hashmd5.Clear();
        }
        else
            keyArray = UTF8Encoding.UTF8.GetBytes(key);

        TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();
        //set the secret key for the tripleDES algorithm
        tdes.Key = keyArray;
        //mode of operation. there are other 4 modes.
        //We choose ECB(Electronic code Book)
        tdes.Mode = CipherMode.ECB;
        //padding mode(if any extra byte added)

        tdes.Padding = PaddingMode.PKCS7;

        ICryptoTransform cTransform = tdes.CreateEncryptor();
        //transform the specified region of bytes array to resultArray
        byte[] resultArray =
          cTransform.TransformFinalBlock(toEncryptArray, 0,
          toEncryptArray.Length);
        //Release resources held by TripleDes Encryptor
        tdes.Clear();
        //Return the encrypted data into unreadable string format
        return Convert.ToBase64String(resultArray, 0, resultArray.Length);
    }

    /// <summary>
    /// Using for decrypt a string
    /// </summary>
    /// <param name="cipherString"></param>
    /// <param name="useHashing"></param>
    /// <returns></returns>
    public static string Decrypt(string cipherString, bool useHashing)
    {
        byte[] keyArray;
        //get the byte code of the string

        byte[] toEncryptArray = Convert.FromBase64String(cipherString);

        System.Configuration.AppSettingsReader settingsReader =
                                            new AppSettingsReader();
        //Get your key from config file to open the lock!
        string key = (string)settingsReader.GetValue("SecurityKey",
                                                     typeof(String));

        if (useHashing)
        {
            //if hashing was used get the hash code with regards to your key
            MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider();
            keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key));
            //release any resource held by the MD5CryptoServiceProvider

            hashmd5.Clear();
        }
        else
        {
            //if hashing was not implemented get the byte code of the key
            keyArray = UTF8Encoding.UTF8.GetBytes(key);
        }

        TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();
        //set the secret key for the tripleDES algorithm
        tdes.Key = keyArray;
        //mode of operation. there are other 4 modes. 
        //We choose ECB(Electronic code Book)

        tdes.Mode = CipherMode.ECB;
        //padding mode(if any extra byte added)
        tdes.Padding = PaddingMode.PKCS7;

        ICryptoTransform cTransform = tdes.CreateDecryptor();
        byte[] resultArray = cTransform.TransformFinalBlock(
                             toEncryptArray, 0, toEncryptArray.Length);
        //Release resources held by TripleDes Encryptor                
        tdes.Clear();
        //return the Clear decrypted TEXT
        return UTF8Encoding.UTF8.GetString(resultArray);
    }

    /// <summary>
    /// sending email , subject is title of email, body is the content, FromName is the name of who send email
    /// </summary>
    /// <param name="Email"></param>
    /// <param name="Subject"></param>
    /// <param name="Body"></param>
    /// <param name="FromName"></param>
    public static void SendMail(string EmailTo, string Subject, string Body, string FromName, string email_id, string email_pass, string email_host)
    {
        // Gmail Address from where you send the mail
        // default test@ferya.info | pass Capsole1@ | Host mail.iris.arvixe.com | port 25

        // from source email to send
        string FromAddress = email_id;

        string FromPassword = email_pass;


        System.Net.Mail.MailMessage eMail = new System.Net.Mail.MailMessage();
        eMail.IsBodyHtml = true;
        eMail.Body = Body;
        eMail.From = new System.Net.Mail.MailAddress("info@sulily.vn", FromName);
        eMail.To.Add(EmailTo);
        eMail.Subject = Subject;
        eMail.Headers.Add("List-Unsubscribe", "<mailto:list@host.com?subject=unsubscribe>");
        eMail.HeadersEncoding = Encoding.Default;
        System.Net.Mail.SmtpClient SMTP = new System.Net.Mail.SmtpClient();

        SMTP.Credentials = new System.Net.NetworkCredential(FromAddress, FromPassword);
        SMTP.Host = email_host;
        SMTP.Send(eMail);
    }
    public static string RemoveSpecial(string str)
    {
        return Regex.Replace(str.Replace("-", " ").Trim(), @"[^\w ]", string.Empty);
    }
    public static string Url(string str)
    {
        return Regex.Replace(Method2(RemoveSpecial(str)), @"\s+", "-").Replace("--", "-").ToLower();
    }
    public static string SearchTag(string str)
    {
        return Regex.Replace(RemoveSpecial(str), @"\s+", " ");
    }
    public static string File(string str)
    {
        return Regex.Replace(Method2(RemoveSpecial(str)), @"\s+", "_");
    }
    public static string ReplaceMultiSpaceWithOne(string str)
    {
        return Regex.Replace(str.Trim(), @"\s+", " ");
    }
    public static string Tag(string str)
    {
        return ReplaceMultiSpaceWithOne(str).Replace(" , ", ",").Replace(" ,", ",").Replace(", ", ",").Replace(",", ", ");
    }
    public static string SearchColumn(string str)
    {
        return Method2(RemoveSpecial(str)).ToLower();
    }

    public static string Method1(string s)
    {
        string stFormD = s.Normalize(NormalizationForm.FormD);
        StringBuilder sb = new StringBuilder();
        for (int ich = 0; ich < stFormD.Length; ich++)
        {
            System.Globalization.UnicodeCategory uc = System.Globalization.CharUnicodeInfo.GetUnicodeCategory(stFormD[ich]);
            if (uc != System.Globalization.UnicodeCategory.NonSpacingMark)
            {
                sb.Append(stFormD[ich]);
            }
        }
        sb = sb.Replace('Đ', 'D');
        sb = sb.Replace('đ', 'd');
        return (sb.ToString().Normalize(NormalizationForm.FormD));
    }
    public static string Method2(string s)
    {
        Regex regex = new Regex("\\p{IsCombiningDiacriticalMarks}+");
        string temp = s.Normalize(NormalizationForm.FormD);
        return regex.Replace(temp, String.Empty).Replace('\u0111', 'd').Replace('\u0110', 'D');
    }
    public static string EncryptPass(string pass)
    {
        return System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(pass.Trim(), "SHA1");
    }

    //Hàm chuyển về dạng tiền tệ VND
    public static string FormatCurrency(object interger)
    {
        CultureInfo ci = new CultureInfo("vi-VN");

        int number = Convert.ToInt32(interger);

        return number.ToString("VNĐ #,###", ci);
    }


    public static string FormatPercenReduced(object bigNum, object smallNum)
    {
        double numBig = Convert.ToDouble(bigNum);
        double numSmall = Convert.ToDouble(smallNum);

        double num = (numSmall * 100) / numBig;
        num = 100 - num;

        return "- " + num.ToString("#.##") + " %";
    }



    public static string RemoveSign4VietnameseString(string str)
    {
        string[] VietnameseSigns = new string[]
        {
            "aAeEoOuUiIdDyY",

            "áàạảãâấầậẩẫăắằặẳẵ",

            "ÁÀẠẢÃÂẤẦẬẨẪĂẮẰẶẲẴ",

            "éèẹẻẽêếềệểễ",

            "ÉÈẸẺẼÊẾỀỆỂỄ",

            "óòọỏõôốồộổỗơớờợởỡ",

            "ÓÒỌỎÕÔỐỒỘỔỖƠỚỜỢỞỠ",

            "úùụủũưứừựửữ",

            "ÚÙỤỦŨƯỨỪỰỬỮ",

            "íìịỉĩ",

            "ÍÌỊỈĨ",

            "đ",

            "Đ",

            "ýỳỵỷỹ",

            "ÝỲỴỶỸ"
        };

        for (int i = 1; i < VietnameseSigns.Length; i++)
        {
            for (int j = 0; j < VietnameseSigns[i].Length; j++)
                str = str.Replace(VietnameseSigns[i][j], VietnameseSigns[0][i - 1]);
        }

        return str;
    }
    public static string RemoveRegex(string input)
    {
        Regex rgx = new Regex("[^a-zA-Z0-9 ]");
        string newText = rgx.Replace(input, "");
        return newText;
    }
    public static string FormatLink(string input)
    {
        input = RemoveSign4VietnameseString(input);
        //input = RemoveRegex(input);
        input = input.Trim().Replace(" ", "-").Replace("--", "-").Replace("---", "-").Replace("<br>", "-").ToLower();
        return input;

    }

    public static string GetIPAddress()
    {
        System.Web.HttpContext context = System.Web.HttpContext.Current;
        string ipAddress = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (!string.IsNullOrEmpty(ipAddress))
        {
            string[] addresses = ipAddress.Split(',');
            if (addresses.Length != 0)
            {
                return addresses[0];
            }
        }

        return context.Request.ServerVariables["REMOTE_ADDR"];
    }

    public static string HTMLToContent(string input)
    {
        List<char> listCharInput = input.ToList();

        bool canDeleteThisChar = false;
        for (int i = 0; i < listCharInput.Count; i++)
        {
            // check special tag 
            if (listCharInput[i] == '<')
            {
                canDeleteThisChar = true;
            }
            else if (listCharInput[i] == '>')
            {
                listCharInput.RemoveAt(i);
                i -= 1;

                canDeleteThisChar = false;
            }

            // delte if tag '<' or inside tag
            if (canDeleteThisChar)
            {
                listCharInput.RemoveAt(i);
                i -= 1;
            }
        }

        return new string(listCharInput.ToArray());
    }
}