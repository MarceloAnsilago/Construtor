#ifndef __CONSTRUTOR_V2_TAB_PAINEL_MQH__
#define __CONSTRUTOR_V2_TAB_PAINEL_MQH__

class CTabPainelV2 : public CConstrutorV2PlaceholderTab
  {
public:
   bool Create(int window_index,CEF_CTabs &tabs,const int tab_index)
     {
      return(CreatePlaceholder(window_index,tabs,tab_index,"Estrutura reservada para o painel consolidado. Este arquivo pode concentrar leitura visual, status e botoes finais."));
     }
  };

#endif // __CONSTRUTOR_V2_TAB_PAINEL_MQH__
