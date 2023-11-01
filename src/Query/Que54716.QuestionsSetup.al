#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Query 54716 "QuestionsSetup"
{

    elements
    {
        dataitem(Application_Chapter;"Application Chapter")
        {
            column(chapterCode;"Code")
            {
            }
            column(Component_Description;"Component Description")
            {
            }
            dataitem(Application_Question_Nos;"Application Question Nos.")
            {
                DataItemLink = Chapter=Application_Chapter.Code;
                column(setupCode;"Code")
                {
                }
                column(Chapter;Chapter)
                {
                }
                column(Question_No;"Question No.")
                {
                }
                column(No_Description;"No. Description")
                {
                }
                dataitem(Accreditation_Questions;"Accreditation Questions")
                {
                    DataItemLink = "Question No."=Application_Question_Nos.Code;
                    column(qnCode;"Code")
                    {
                    }
                    column(Description;Description)
                    {
                    }
                    column(Question_Type;"Question Type")
                    {
                    }
                    column(qnQuestion_No;"Question No.")
                    {
                    }
                    dataitem(Application_SubQuestion;"Application SubQuestion")
                    {
                        DataItemLink = "Question Code"=Accreditation_Questions.Code;
                        column(subquestionCode;"Code")
                        {
                        }
                        column(Question_Code;"Question Code")
                        {
                        }
                        column(subquestionDescription;Description)
                        {
                        }
                        column(subquestionQuestion_Type;"Question Type")
                        {
                        }
                    }
                }
            }
        }
    }
}

