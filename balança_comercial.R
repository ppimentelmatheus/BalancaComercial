# Balança Comercial - Santa Catarina --------------------------------------

library(GetBCBData)
library(ggplot2)
library(ipeadatar)

bc_sc = ggplot2bc_sc = GetBCBData::gbcbd_get_series(
  id = 13083,
  first.date = '1997-01-01',
  last.date = Sys.Date()
) |> 
  dplyr::select(ref.date,
                value) |> dplyr::rename(
                  'date' = ref.date,
                  'bc_sc' = value
                )

ggplot2::ggplot(bc_sc, aes(x=date, y = bc_sc))+geom_line()+
  labs(title = "Balança Comercial de Santa Catarina")


# Balança Comercial - Brasil ----------------------------------------------

exportacao = ipeadatar::ipeadata(
  code = "SECEX12_XVTOT12"
) |> 
  dplyr::select(date, value) |> 
  dplyr::rename(exp = value)

importacao = ipeadatar::ipeadata(
  code = "SECEX12_MVTOT12"
)
