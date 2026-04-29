#ifndef __CONSTRUTOR_V2_TAB4_TAKE_PROFIT_MQH__
#define __CONSTRUTOR_V2_TAB4_TAKE_PROFIT_MQH__

class CTab4TakeProfitV2 : public CConstrutorV2PlaceholderTab
  {
public:
   bool Create(CEF_CWndCreate &host,int window_index,CEF_CTabs &tabs,const int tab_index)
     {
      return(CreatePlaceholder(host,window_index,tabs,tab_index,"Estrutura reservada para take profit. O objetivo aqui e espelhar os modos fixo, calculo, multiplicador e indicador."));
     }
  };

#endif // __CONSTRUTOR_V2_TAB4_TAKE_PROFIT_MQH__
