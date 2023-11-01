#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50105 "pageextension50105" extends "Maintenance Registration" 
{
    layout
    {
        addafter("Service Date")
        {
            field("Planned date"; Rec."Planned date")
            {
                ApplicationArea = Basic;
                Caption = 'Date planned';
            }
            field(Type; Rec.Type)
            {
                ApplicationArea = Basic;
                Caption = 'Type of Maintenance';
            }
            field("Description of activitty"; Rec."Description of activitty")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

#pragma implicitwith restore

