NB.* charXlateSend.ijs: translate APL characters to ÈAV indexes to paste into AIX APL session.

QAV=: (5$0{a.),'ÙÙÙÙÙÙ|%''´²_abcdefghijklmnopqrstuvwxyzÙÙÚ.Ó0123456789ÙÙÙ$Ô€®ABCDEFGHIJKLMNOPQRSTUVWXYZÙÙÙÙÙâãäåæçèéêëìíîïðñòóôõö÷øùúûü{×}ØÙÜÙÙÙÙÆÙÙÙÙÙÙÙÙÙÙÙÙÙÙÙÙÙÙÙÙÙ[/¾\¿<¸=·>°ß^-+¯¡?µ³~þÿÛÝ*ÏÎý¼(àáÑÒ¹º|;,ÅÄÃÂÐÕÖÇÊ!ÁÀËÌ¶ÍÙÙÙÙ"#Ù&''¬¥­¦«ª©£§¨¢@ÙÙÙ^Ù`|Ù:ÙÙÙ±»Þ½)]ÙÙÙÈÉÙ'
QAV=: (LF,CR,' ',TAB) (2 3 4 9)}QAV

xlate=: 4 : '1+x i. y'  NB. Assume target APL uses origin 1.
xlateAPL=: QAV&xlate

eguse=. 0 : 0
NB. To get a listing file (GOOFX.LISTING) onto AIX:
(":xlateAPL LF-.~fread 'C:/amisc/Tegra/WSExplore/GOOFX.LISTING') fwrite 'C:/amisc/Tegra/WSExplore/TEST.XFER'

NB. Cut and paste contents of this file to TEST.XFER on AIX machine eampaccess01, then
rcp TEST.XFER eaapdev07:/home/dmccormi/TEST.XFER

NB. Then, on eaapdev07, do this in APL:
TN»'TEST.XFER' ÈNTIE 0 ± NN»ÈNREAD TN 82 (ÈNSIZE TN) ± LISTING»ÈAV[ÀNN] ± ÈNUNTIE TN
)
