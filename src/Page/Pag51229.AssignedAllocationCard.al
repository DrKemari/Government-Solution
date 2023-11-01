#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51229 "Assigned  Allocation Card"
{
    Editable = true;
    PageType = Card;
    SourceTable = "Proposal Document Sub-Topic";

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = false;
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Topic Code"; Rec."Topic Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Topic Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                // field("Appointment Date"; "Appointment Date")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Appointment Date field.';
                // }
                // field("Start Date"; "Start Date")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Start Date field.';
                // }
                // field("Tentative End Date"; "Tentative End Date")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Tentative End Date field.';
                // }
                field(Chapter; Rec.Chapter)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Chapter field.';
                }
                // field("Created On"; "Created On")
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                //     ToolTip = 'Specifies the value of the Created On field.';
                // }
            }
            // group(Control9)
            // {
            //     part(Control8; "Ass. Resource allocation Lines")
            //     {
            //         SubPageLink = "Inst Application No." = field("Topic Code"),
            //                      Published = const(Yes);
            //         ApplicationArea = Basic;
            //     }
            // }
        }
    }

    actions
    {
        area(creation)
        {
            action("Book Payment")
            {
                ApplicationArea = Basic;
                Image = Add;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Book Payment action.';
                trigger OnAction()
                begin
                    Rec.SetRange(Code, Rec.Code);
                    Report.Run(51192, true, true, Rec);
                end;
            }
        }
    }

    var
        ResourceLines: Record "Site Inspection Comment";
        JobPlanningLines: Record "Job Planning Line";
        JobTaskLines: Record "Job Task";
        FileDirectory: Text;
        FileName: Text;
        //  SMTPMailSet: Record "Email Account";
        ServiceItem: Record "Service Item";
        Service: Text;
        // Notification1: Codeunit "Email Message";
        objCustomer: Record Resource;
        CompInfo: Record "Company Information";
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        LineNo: Integer;
        Accreditation: Record Customer;
        FileDirectory1: Text;
        FileName1: Text;
        Resource: Record Resource;
}

#pragma implicitwith restore

