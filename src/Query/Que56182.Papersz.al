#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Query 56182 "Papersz"
{

    elements
    {
        dataitem(Level;Level)
        {
            column("Code";"Code")
            {
            }
            column(Course;Course)
            {
            }
            column(Levelz;Level)
            {
            }
            dataitem(Papers;Papers)
            {
                DataItemLink = Level=Level.Code,Course=Level.Course;
                column(Codes;"Code")
                {
                }
                column(Coursez;Course)
                {
                }
                column(Section;Section)
                {
                }
                column(Levels;Level)
                {
                }
                column(Description;Description)
                {
                }
                column(No_of_Passed_Students;"No. of Passed Students")
                {
                }
                column(No_of_Failed_Students;"No. of  Failed Students")
                {
                }
            }
        }
    }
}

