#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 56064 "Visitor Pass"
{
    PageType = Card;
    SourceTable = "Visitors Pass";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Date of visit"; Rec."Date of visit")
                {
                    ApplicationArea = Basic;
                }
                field("Time of visit"; Rec."Time of visit")
                {
                    ApplicationArea = Basic;
                }
                field("Visitor Name"; Rec."Visitor Name")
                {
                    ApplicationArea = Basic;
                }
                field("ID No"; Rec."ID No")
                {
                    ApplicationArea = Basic;
                }
                field("Mobile No."; Rec."Mobile No.")
                {
                    ApplicationArea = Basic;
                }
                field(From; Rec.From)
                {
                    ApplicationArea = Basic;
                }
                field("Officer to see No"; Rec."Officer to see No")
                {
                    ApplicationArea = Basic;
                }
                field("Officer to see Name"; Rec."Officer to see Name")
                {
                    ApplicationArea = Basic;
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = Basic;
                }
                field("Officers Comment"; Rec."Officers Comment")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control18; Notes)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = PrintReport;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.SetRange(No, Rec.No);
                    Report.Run(56236, true, true, Rec);
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = PostedMemo;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin

                    //Visitor.TESTFIELD(Visitor."Created By",USERID);
                    Rec.TestField(Reason);
                    Rec.TestField("Visitor Name");
                    Rec.TestField("ID No");
                    Rec.TestField("Officer to see Name");
                    Rec.TestField("Officers Comment");

                    Rec.Modify;

                    Message('Posted successfully');
                end;
            }
        }
    }

    var
        text001: label 'Status must be Released to allow posting';
        Visitor: Record "Visitors Pass";
}

#pragma implicitwith restore

