#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50030 "pageextension50030" extends Budget
{
    layout
    {
        addafter(General)
        {


            //     part("Attached Documents"; "Document Attachment Factbox")
            //     {
            //         ApplicationArea = All;
            //         Caption = 'Attachments';
            //         SubPageLink = "Table ID" = CONST(95),
            //                       "No." = FIELD(Name);
            //     }
            //     systempart(PyamentTermsLinks; Links)
            //     {
            //         ApplicationArea = RecordLinks;
            //     }
            //     systempart(PyamentTermsNotes; Notes)
            //     {
            //         ApplicationArea = Notes;
            //     }
        }

    }
    actions
    {
        addafter("Copy Budget")
        {
            action("Create Project")
            {
                ApplicationArea = Suite;
                Caption = 'Create Project';
                Ellipsis = true;
                Image = CopyForecast;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Create a job to allow consumption of budget';

                trigger OnAction()
                var
                    Examination: Codeunit Examination;
                    TXT001: label 'Are you sure you want to create a project for this budget';
                begin
                    if Confirm(TXT001) = true then begin
                        Examination.CreateProjectFromBudget(BudgetName);
                    end
                end;
            }
        }
    }
}

