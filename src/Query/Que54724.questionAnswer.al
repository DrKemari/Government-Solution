#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Query 54724 "questionAnswer"
{

    elements
    {
        dataitem(Accreditation_Questions;"Accreditation Questions")
        {
            column("Code";"Code")
            {
            }
            column(Description;Description)
            {
            }
            column(Question_Type;"Question Type")
            {
            }
            column(Question_No;"Question No.")
            {
            }
            dataitem(Application_Response;"Application Response")
            {
                DataItemLink = "Question Code"=Accreditation_Questions.Code;
                column(Application_No;"Application No.")
                {
                }
                column(Accreditation_Question;"Accreditation Question")
                {
                }
                column(Question_TypeAnswer;"Question Type")
                {
                }
                column(Question_Code;"Question Code")
                {
                }
            }
        }
    }
}

