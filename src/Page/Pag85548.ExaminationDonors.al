#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 85548 "Examination Donors"
{
    ApplicationArea = Basic;
    CardPageID = "Examination Donor Card";
    Editable = false;
    PageType = List;
    SourceTable = "Examination Donors";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No;Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field(Email;Rec.Email)
                {
                    ApplicationArea = Basic;
                }
                field(Telephone;Rec.Telephone)
                {
                    ApplicationArea = Basic;
                }
                field(ExaminationSitting;Rec."Examination Sitting")
                {
                    ApplicationArea = Basic;
                }
                field(Examination;Rec.Examination)
                {
                    ApplicationArea = Basic;
                }
                field(Level;Rec.Level)
                {
                    ApplicationArea = Basic;
                }
                field(PaperCode;Rec."Paper Code")
                {
                    ApplicationArea = Basic;
                }
                field(PaperName;Rec."Paper Name")
                {
                    ApplicationArea = Basic;
                }
                field(Address;Rec.Address)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control8;Outlook)
            {
            }
            systempart(Control9;Notes)
            {
            }
            systempart(Control10;MyNotes)
            {
            }
            systempart(Control11;Links)
            {
            }
        }
    }

    actions
    {
    }
}
