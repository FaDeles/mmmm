using EasyCaptcha.Wpf;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Misharin309
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            m.CreateCaptcha(EasyCaptcha.Wpf.Captcha.LetterOption.Alphanumeric, 5);
            var answer = m.CaptchaText;
            
        }
        
        
        //Рефреш капчи
        private void VvodCap(object sender, RoutedEventArgs e)
        {
            m.CreateCaptcha(EasyCaptcha.Wpf.Captcha.LetterOption.Alphanumeric, 5);
        }

        //Проверка логина и пароля
        private void Button_Click(object sender, RoutedEventArgs e)
        {
               //Тут проверяется еще и капча
            var answer = m.CaptchaText;
            if (answer == m.CaptchaText)
            {
                
            }
            else
            {
                MessageBox.Show("Вы не прошли проверку");

            }
            //Тут начинаем использовать бд для сравнения по логину и паролю
            using (tradeEntities unling = new tradeEntities())
            {
                var qq = unling.User;
                foreach (var item in qq)
                {
                    
                    if (item.UserLogin == log.Text)
                    {
                        if (item.UserPassword == pas.Password)
                        {
                           if(item.UserRole == 1)
                            {
                                MessageBox.Show("Добро пожаловать, дорогой клиент");
                            }
                           if(item.UserRole == 2)
                            {
                                MessageBox.Show("Добро пожаловать, менеджер");
                            }
                           if(item.UserRole == 3)
                            {
                                MessageBox.Show("Добро пожаловать, товарищ Администратор");
                            }
                        }
                        else
                        {
                            MessageBox.Show("Вы неправильно ввели пароль или логин");
                        }
                    }
                    
                    

                }


            }

             
                
        }
    }
}
