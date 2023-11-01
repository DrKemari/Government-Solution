#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50063 "pageextension50063" extends "Dimension Values"
{
    layout
    {
        addafter(Name)
        {
            field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
            {
                ApplicationArea = Basic;
            }
            field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
            {
                ApplicationArea = Basic;
            }
            field("Apply Unit filter"; Rec."Apply Unit filter")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(Blocked)
        {
            field("Hardship Area"; Rec."Hardship Area")
            {
                ApplicationArea = Basic;
            }
            field("Hardship Type"; Rec."Hardship Type")
            {
                ApplicationArea = Basic;
            }
            field(Registrar; Rec.Registrar)
            {
                ApplicationArea = Basic;
            }
            field("Deputy Registrar"; Rec."Deputy Registrar")
            {
                ApplicationArea = Basic;
            }
            field(Director; Rec.Director)
            {
                ApplicationArea = Basic;
            }
            field("Head of Station"; Rec."Head of Station")
            {
                ApplicationArea = Basic;
            }
            field(HOD; Rec.HOD)
            {
                Caption = 'Head/President';
                ApplicationArea = Basic;
            }
        }
    }
}

#pragma implicitwith restore

