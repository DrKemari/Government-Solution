#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50075 "tableextension50075" extends "SMTP Mail Setup" 
{
    fields
    {
        field(50000;"Email Sender Address";Text[80])
        {
        }
        field(50001;"Email Sender Name";Text[80])
        {
            DataClassification = ToBeClassified;
        }
    }
}

