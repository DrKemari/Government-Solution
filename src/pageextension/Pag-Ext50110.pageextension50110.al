#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50110 "pageextension50110" extends "Warehouse Receipt" 
{
    layout
    {
        addafter("Sorting Method")
        {
            field("Source Document"; Rec."Source Document")
            {
                ApplicationArea = Basic;
            }
            field("Source No."; Rec."Source No.")
            {
                ApplicationArea = Basic;
            }
            field("Inspection Team Setup?"; Rec."Inspection Team Setup?")
            {
                ApplicationArea = Basic;
            }
            field("Inspection Completed?"; Rec."Inspection Completed?")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

#pragma implicitwith restore

