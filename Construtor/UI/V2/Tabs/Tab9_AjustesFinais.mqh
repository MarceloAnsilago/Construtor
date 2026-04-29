#ifndef __CONSTRUTOR_V2_TAB9_AJUSTES_FINAIS_MQH__
#define __CONSTRUTOR_V2_TAB9_AJUSTES_FINAIS_MQH__

class CTab9AjustesFinaisV2 : public CConstrutorV2PlaceholderTab
  {
public:
   bool Create(int window_index,CEF_CTabs &tabs,const int tab_index)
     {
      return(CreatePlaceholder(window_index,tabs,tab_index,"Estrutura reservada para ajustes finais. Este arquivo pode concentrar validacoes, acabamento e revisoes antes da execucao."));
     }
  };

#endif // __CONSTRUTOR_V2_TAB9_AJUSTES_FINAIS_MQH__
