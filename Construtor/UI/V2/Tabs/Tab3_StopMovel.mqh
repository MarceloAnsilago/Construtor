#ifndef __CONSTRUTOR_V2_TAB3_STOP_MOVEL_MQH__
#define __CONSTRUTOR_V2_TAB3_STOP_MOVEL_MQH__

class CTab3StopMovelV2 : public CConstrutorV2PlaceholderTab
  {
public:
   bool Create(int window_index,CEF_CTabs &tabs,const int tab_index)
     {
      return(CreatePlaceholder(window_index,tabs,tab_index,"Estrutura reservada para o stop movel. Migre aqui os modos padrao, candle a candle e por indicador."));
     }
  };

#endif // __CONSTRUTOR_V2_TAB3_STOP_MOVEL_MQH__
