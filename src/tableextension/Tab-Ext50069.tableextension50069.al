#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50069 "tableextension50069" extends "Dimension Value"
{
    DrillDownPageID = "Dimension Value List";
    fields
    {

        //Unsupported feature: Property Modification (Data type) on "Name(Field 3)".

        field(50023; "Pay Period Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll PeriodX"."Starting Date";
        }
        field(50024; "Region Filter"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = County1.Code;
        }
        field(50025; "Hardship Area"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50026; "Hardship Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Extreme,Moderate';
            OptionMembers = " ",Extreme,Moderate;
        }
        field(50027; HOD; Code[20])
        {

            // TableRelation = "Employee"."No." where(HOD = const(true));
            TableRelation = "User Setup"."User ID";
        }
        field(50028; Director; Code[20])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(50031; Registrar; Code[20])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(50029; "Deputy Registrar"; Code[20])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(50030; "Head of Station"; Code[20])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(40; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));
        }

        field(41; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          Blocked = CONST(false));

        }
        field(141; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                          Blocked = CONST(false));

        }
        field(43; "Apply Unit filter"; Boolean)
        {

        }

    }
}

