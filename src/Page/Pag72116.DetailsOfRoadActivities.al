#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72116 "Details Of Road Activities"
{
    PageType = List;
    SourceTable = "Details Of Road Activities";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item Code"; Rec."Item Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Item Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Unit; Rec.Unit)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Rate(LCY)"; Rec."Rate(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rate(LCY) field.';
                }
                field("Bill Item Amount(LCY)"; Rec."Bill Item Amount(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bill Item Amount(LCY) field.';
                }
                field("Start Chainage(Km)"; Rec."Start Chainage(Km)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Chainage(Km) field.';
                }
                field("End Chainage(Km)"; Rec."End Chainage(Km)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Chainage(Km) field.';
                }
                field(Technology; Rec.Technology)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Technology field.';
                }
                field("Labour(%)"; Rec."Labour(%)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Labour(%) field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

