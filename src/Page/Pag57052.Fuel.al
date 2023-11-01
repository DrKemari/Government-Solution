#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57052 "Fuel"
{
    PageType = ListPart;
    SourceTable = "Project Members";
    SourceTableView = where(Type = const(Machine));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Type field.';
                    trigger OnValidate()
                    begin
                        if Rec.Type = Rec.Type::Person then begin
                            Show := true;
                            Error(Text000);
                        end;
                    end;
                }
                field("Work Type"; Rec."Work Type")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Work Type field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Expense Type"; Rec."Expense Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expense Type field.';
                }
                field("Task No."; Rec."Task No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Task No. field.';
                }
                field("Tasks to Carry Out"; Rec."Tasks to Carry Out")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Tasks to Carry Out field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("Consumption Rate"; Rec."Consumption Rate")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Enabled = true;
                    ToolTip = 'Specifies the value of the Consumption Rate field.';
                }
                field(Mileage; Rec."Time Period")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Time Period field.';
                }
                field("Outstanding Amount"; Rec."Outstanding Amount")
                {
                    ApplicationArea = Basic;
                    Visible = Show;
                    ToolTip = 'Specifies the value of the Outstanding Amount field.';
                }
                field(Total; Rec.Entitlement)
                {
                    ApplicationArea = Basic;
                    Visible = Show;
                    ToolTip = 'Specifies the value of the Entitlement field.';
                }
                field("Expected Output"; Rec."Expected Output")
                {
                    ApplicationArea = Basic;
                    Visible = Show;
                    ToolTip = 'Specifies the value of the Expected Output field.';
                }
                field(Delivery; Rec.Delivery)
                {
                    ApplicationArea = Basic;
                    Visible = Show;
                    ToolTip = 'Specifies the value of the Delivery field.';
                }
                field("Last Maintenance Cost"; Rec."Last Maintenance Cost")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Last Maintenance Cost field.';
                }
                field("Expected  Cost"; Rec."Expected Maintenance Cost")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Expected Maintenance Cost field.';
                }
                field("Direct Unit Cost"; Rec."Direct Unit Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Direct Unit Cost field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields(Project);
        if Rec.Type = Rec.Type::Person then
            Show := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.CalcFields(Project);
        Rec.Type := Rec.Type::Machine;
    end;

    trigger OnOpenPage()
    begin
        Rec.CalcFields(Project);
    end;

    var
        [InDataSet]
        Show: Boolean;
        Text000: label 'You cannot enter Person under Fuel';
}

#pragma implicitwith restore

