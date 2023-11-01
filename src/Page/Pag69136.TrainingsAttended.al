#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69136 "Trainings Attended"
{
    PageType = ListPart;
    SourceTable = "Applicant Background";
    SourceTableView = where(Type = filter(Training));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("From Date"; Rec."From Date")
                {
                    ApplicationArea = Basic;
                }
                field("To Date"; Rec."To Date")
                {
                    ApplicationArea = Basic;
                }
                field(Institution; Rec.Institution)
                {
                    ApplicationArea = Basic;
                    Caption = 'Trainer';
                }
                field(Attainment; Rec.Attainment)
                {
                    ApplicationArea = Basic;
                }
                field(Specialization; Rec.Specialization)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

