#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69191 "HR Salary Increament Card"
{
    PageType = Card;
    SourceTable = "HR Salary Increament Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = editability;
                field("Batch No"; Rec."Batch No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Batch No field.';
                }
                field(Descriptions; Rec.Descriptions)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Descriptions field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Run By"; Rec."Run By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Run By field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Control10; "Hr Salary Increament Lines")
            {
                Editable = editability;
                Enabled = editability;
                SubPageLink = "Batch No" = field("Batch No");
                UpdatePropagation = SubPart;
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control8; Links)
            {
                ApplicationArea = Basic;
            }
            systempart(Control9; Notes)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Effect Salary Increament")
            {
                ApplicationArea = Basic;
                Enabled = editability;
                Image = PayrollStatistics;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Effect Salary Increament action.';
                trigger OnAction()
                begin
                    if Rec."Effective Date" = 0D then
                        Error('Please select effective date');
                    Rec.TestField(Status, Rec.Status::Open);
                    Lines.Reset;
                    Lines.SetRange("Batch No", Rec."Batch No");
                    Lines.SetRange("Effective Date", Rec."Effective Date");
                    if Lines.Find('-') then begin
                        repeat
                            Lines.Validate("New Present");
                            Lines.Validate("New Salary Scale");
                            Employee.Reset;
                            Employee.SetRange("No.", Lines."Employee No");
                            if Employee.FindSet then begin
                                if Lines."New Salary Scale" <> '' then begin
                                    Employee."Salary Scale" := Lines."New Salary Scale";
                                end;
                                if Lines."New Present" <> '' then begin
                                    Employee.Present := Lines."New Present";
                                end;
                                if Lines."Current Present" <> '' then begin
                                    Employee.Previous := Lines."Current Present";
                                end;
                                if Lines."Current Salary Scale" <> '' then begin

                                    Employee."Current Terms of Service" := Lines."Current  Terms of Service";
                                end;
                                Employee.Modify;
                            end;
                        until Lines.Next = 0;
                        Message('Salary Increament Completed..');
                        if Dialog.Confirm('You can now close this batch,\Do you want to close the batch?', true) then
                            Rec.Status := Rec.Status::Closed;
                    end;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        editability := true;
        if Rec.Status = Rec.Status::Closed then
            editability := false;
    end;

    var
        Employee: Record Employee;
        Header: Record "HR Salary Increament Header";
        Lines: Record "HR Salary Increament Lines";
        editability: Boolean;
}

#pragma implicitwith restore

