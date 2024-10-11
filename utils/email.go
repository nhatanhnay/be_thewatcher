package utils

import (
    "fmt"
    "net/smtp"
)

func SendEmail(to string, subject string, body string) error {
    from := "lecongnhatanh@gmail.com" 
    password := "zrcd aoox zhhl idtn"

    smtpHost := "smtp.gmail.com"
    smtpPort := "587"

    message := []byte("Subject: " + subject + "\r\n" +
        "\r\n" + body)

    auth := smtp.PlainAuth("", from, password, smtpHost)

    err := smtp.SendMail(smtpHost+":"+smtpPort, auth, from, []string{to}, message)
    if err != nil {
		fmt.Println("SendEmail - Error: " + err.Error())
        return err
    }

    fmt.Println("Email Sent Successfully!")
    return nil
}
