#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
/// <summary>
/// TableExtension tableextension50083 (ID 50083) extends Record Document Attachment.
/// </summary>
TableExtension 50083 "Document Attachment" extends "Document Attachment"
{
    fields
    {
        modify("Document Type")
        {
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Plaintiffs,Defendants,Court Hearings,HR Case,Audit';

            //Unsupported feature: Property Modification (OptionString) on ""Document Type"(Field 13)".

        }
        field(19; "Audit Checklist ID"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Audit Checklist Name"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Audit Finding ID"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Audit Name"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(70134700; "Document Category"; code[20])
        {

        }
        field(70134701; "Document Description"; Text[200])
        {

        }
        field(70134702; "EDMS Link"; Text[300])
        {

        }
    }
    keys
    {
        // Unsupported feature: Key containing base fields
        // key(Key1;"No.")
        // {
        // }
    }
}

