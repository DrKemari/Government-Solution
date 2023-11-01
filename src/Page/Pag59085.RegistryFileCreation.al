#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59085 "Registry File Creation"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Registry File Creation";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("File No"; Rec."File No")
                {
                    ApplicationArea = Basic;
                }
                field("File Type"; Rec."File Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'File Classification';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("File Name"; Rec."File Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'File Index';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Division/Unit"; Rec."Division/Unit")
                {
                    ApplicationArea = Basic;
                }
                field("Division/Unit Name"; Rec."Division/Unit Name")
                {
                    ApplicationArea = Basic;
                }
                field("Sub Division"; Rec."Sub Division")
                {
                    ApplicationArea = Basic;
                }
                field("Sub Division Name"; Rec."Sub Division Name")
                {
                    ApplicationArea = Basic;
                }
                field(Custody; Rec.Custody)
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(Confidential; Rec.Confidential)
                {
                    ApplicationArea = Basic;
                }
                field("File Status"; Rec."File Status")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("File Entries")
            {
                ApplicationArea = Basic;
                Image = Filed;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "File Movement Line";
                RunPageLink = "File Number"=field("File No");
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Created By" := UserId;
        Rec."Creation Date" := Today;
    end;
}

#pragma implicitwith restore

