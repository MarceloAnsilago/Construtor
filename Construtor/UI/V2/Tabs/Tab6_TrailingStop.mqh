#ifndef __CONSTRUTOR_V2_TAB6_TRAILING_STOP_MQH__
#define __CONSTRUTOR_V2_TAB6_TRAILING_STOP_MQH__

class CTab6TrailingStopV2 : public CConstrutorV2PlaceholderTab
  {
public:
   bool Create(int window_index,CEF_CTabs &tabs,const int tab_index)
     {
      return(CreatePlaceholder(window_index,tabs,tab_index,"Estrutura reservada para trailing stop. Separe aqui a logica padrao, candles e indicador."));
     }
  };

#endif // __CONSTRUTOR_V2_TAB6_TRAILING_STOP_MQH__
