#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Query 80049 "Resources2"
{

    elements
    {
        dataitem(Resource;Resource)
        {
            column(No;"No.")
            {
            }
            column(Type;Type)
            {
            }
            column(Name;Name)
            {
            }
            dataitem(Employee;Employee)
            {
                DataItemLink = "No."=Resource."No.";
                column(Status;Status)
                {
                }
            }
        }
    }
}

