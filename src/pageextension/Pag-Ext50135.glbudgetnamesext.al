// /// <summary>
// /// PageExtension gl budget names ext (ID 50135) extends Record G/L Budget Names.
// /// </summary>
// pageextension 50136 "gl budget names ext" extends "G/L Budget Names"
// {
//     layout
//     {
//         addafter(Control1)
//         {


//             part("Attached Documents"; "Document Attachment Factbox")
//             {
//                 ApplicationArea = All;
//                 Caption = 'Attachments';
//                 SubPageLink = "Table ID" = CONST(95),
//                               "No." = FIELD(Name);
//             }
//             systempart(PyamentTermsLinks; Links)
//             {
//                 ApplicationArea = RecordLinks;
//             }
//             systempart(PyamentTermsNotes; Notes)
//             {
//                 ApplicationArea = Notes;
//             }
//         }

//     }

// }
