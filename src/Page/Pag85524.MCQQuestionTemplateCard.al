#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 85524 "MCQ Question Template Card"
{
    PageType = Document;
    SourceTable = "MCQ Question Template";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(DocumentNo;Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(CreatedBy;Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field(CreatedOn;Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control12;"MCQ Template Lines")
            {
                SubPageLink = "Document No"=field("Document No.");
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
