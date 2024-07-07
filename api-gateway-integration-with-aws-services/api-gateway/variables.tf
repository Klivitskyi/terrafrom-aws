variable "supported_binary_media_types" {
  type        = list(string)
  default = [
    "application/octet-stream",
    "image/jpeg",
    "image/gif",
    "image/png",
    "image/bmp",
    "image/svg+xml",
    "application/pdf",
    "application/msword",                                                      #.doc, .dot
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document", #.docx 
    "application/vnd.openxmlformats-officedocument.wordprocessingml.template", #.dotx
    "application/vnd.ms-word.document.macroEnabled.12",                        #.docm
    "application/vnd.ms-word.template.macroEnabled.12",                        #.dotm 
    "application/vnd.ms-excel",                                                #.xls, .xlt, .xla
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",       #.xlsx
    "application/vnd.openxmlformats-officedocument.spreadsheetml.template",    #.xltx
    "application/vnd.ms-excel.sheet.macroEnabled.12",                          #.xlsm
    "application/vnd.ms-excel.template.macroEnabled.12",                       #.xltm
    "application/vnd.ms-excel.addin.macroEnabled.12",                          #.xlam     
    "application/vnd.ms-excel.sheet.binary.macroEnabled.12",                   #.xlsb
    "application/vnd.ms-powerpoint",                                           #.ppt, .pot, .pps, .ppa 
    "application/zip",
    "application/x-7z-compressed",
    "text/plain",
    "image/tiff",
    "image/x-dcraw",                                                           # Digital raw image
  ]
}