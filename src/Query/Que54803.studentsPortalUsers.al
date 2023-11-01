#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Query 54803 "studentsPortalUsers"
{

    elements
    {
        dataitem(Dynasoft_Portal_User;"Dynasoft Portal User")
        {
            column(Entry_No;"Entry No")
            {
            }
            column(User_Name;"User Name")
            {
            }
            column(Full_Name;"Full Name")
            {
            }
            column(Authentication_Email;"Authentication Email")
            {
            }
            column(Mobile_Phone_No;"Mobile Phone No.")
            {
            }
            column(State;State)
            {
            }
            column(Change_Password;"Change Password")
            {
            }
            column(Record_Type;"Record Type")
            {
            }
            column(Record_ID;"Record ID")
            {
            }
            column(Password_Value;"Password Value")
            {
            }
            column(Last_Modified_Date;"Last Modified Date")
            {
            }
            column(Student_Name;"Student Name")
            {
            }
            column(PasswordChanged;PasswordChanged)
            {
            }
            column(Notified;Notified)
            {
            }
            column(Notification_Date;"Notification Date")
            {
            }
            column(FirstName;FirstName)
            {
            }
            column(LastName;LastName)
            {
            }
            column(MiddleName;MiddleName)
            {
            }
            column(Id_Number;"Id Number")
            {
            }
            dataitem(Customer;Customer)
            {
                DataItemLink = "ID. No."=Dynasoft_Portal_User."Id Number";
                column(No;"No.")
                {
                }
            }
        }
    }
}

