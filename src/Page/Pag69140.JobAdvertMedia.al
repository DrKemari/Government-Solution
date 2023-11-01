#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69140 "Job Advert Media"
{
    PageType = Card;
    SourceTable = "Job Advert Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                // field(Mode; Mode)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Mode field.';
                // }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field(Published; Rec.Published)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Published field.';
                }
            }
            part(Control10; "Vacancy Media Advertisements")
            {
                SubPageLink = "Job Advert No." = field(Code);
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Job Advert")
            {
                ApplicationArea = Basic;
                Image = Document;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                // RunObject = Report "Job advert Template";
                ToolTip = 'Executes the Job Advert action.';
            }
        }
    }
}

#pragma implicitwith restore

