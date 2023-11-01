#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 70114 "Disposal Sub Page"
{
    PageType = ListPart;
    SourceTable = "Disposal Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Disposal Item No"; Rec."Disposal Item No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disposal Item No field.';
                }
                field("Fixed Asset/Item No."; Rec."Fixed Asset/Item No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fixed Asset/Item No. field.';
                }
                field("Unit of Issue"; Rec."Unit of Issue")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Issue field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Estimated current value"; Rec."Estimated current value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Estimated current value field.';
                }
                field("Description of Item"; Rec."Description of Item")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description of Item field.';
                }
                field("Disposal Type"; Rec."Disposal Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disposal Type field.';
                }
                field("Disposal Methods"; Rec."Disposal Methods")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disposal Methods field.';
                }
                field("FA Name"; Rec."FA Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the FA Name field.';
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Location field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

