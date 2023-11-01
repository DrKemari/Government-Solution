#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Query 56207 "Employee"
{

    elements
    {
        dataitem(Employee;Employee)
        {
            column(Global_Dimension_2_Code;"Global Dimension 2 Code")
            {
            }
            column(Department_Code;"Department Code")
            {
            }
            column(Status;Status)
            {
            }
            dataitem(Resource;Resource)
            {
                DataItemLink = "No."=Employee."No.";
                column(No;"No.")
                {
                }
                column(Type;Type)
                {
                }
                column(Name;Name)
                {
                }
            }
        }
    }
}

