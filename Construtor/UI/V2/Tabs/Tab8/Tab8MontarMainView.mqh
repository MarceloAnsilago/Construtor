#ifndef __CONSTRUTOR_V2_TAB8_MONTAR_MAIN_VIEW_MQH__
#define __CONSTRUTOR_V2_TAB8_MONTAR_MAIN_VIEW_MQH__

#include "Tab8Shared.mqh"

class CTab8MontarMainView : public CEF_CWndCreate
  {
private:
   CEF_CWndCreate *m_host;
   bool            m_created;
   int             m_window_index;
   int             m_tab_index;

   CEF_CFrame      m_card_slots;
   CEF_CTextLabel  m_card_slots_title;
   CEF_CTextLabel  m_card_slots_body;
   CEF_CFrame      m_card_parametros;
   CEF_CTextLabel  m_card_parametros_title;
   CEF_CTextLabel  m_card_parametros_body;
   CEF_CFrame      m_card_logica;
   CEF_CTextLabel  m_card_logica_title;
   CEF_CTextLabel  m_card_logica_body;

public:
                     CTab8MontarMainView(void) : m_host(NULL), m_created(false), m_window_index(-1), m_tab_index(-1) {}

   bool Create(CEF_CWndCreate &host,int window_index,CEF_CTabs &tabs,const int tab_index)
     {
      if(m_created)
         return(true);

      m_host=&host;
      m_window_index=window_index;
      m_tab_index=tab_index;

      const int tabs_w=tabs.XSize();
      const int content_pad=24;
      const int content_y=82;
      const int content_w=tabs_w-(content_pad*2);
      const int gap=12;
      const int left_w=300;
      const int right_w=content_w-left_w-gap;
      const int top_h=252;
      const int bottom_h=180;

      if(!V2CreateSectionPlaceholder(*m_host,m_card_slots,m_card_slots_title,m_card_slots_body,tabs,tabs,m_window_index,m_tab_index,content_pad,content_y,left_w,top_h,"Indicadores base","Primeira etapa da migracao de Montar sinais. Cada um dos 4 slots deve virar um subcomponente proprio com seletor e atalho."))
         return(false);
      if(!V2CreateSectionPlaceholder(*m_host,m_card_parametros,m_card_parametros_title,m_card_parametros_body,tabs,tabs,m_window_index,m_tab_index,content_pad+left_w+gap,content_y,right_w,top_h,"Parametros por indicador","Aqui entram os cards/tabsets aninhados por slot. Este e o maior centro de complexidade parametrica da aba 8."))
         return(false);
      if(!V2CreateSectionPlaceholder(*m_host,m_card_logica,m_card_logica_title,m_card_logica_body,tabs,tabs,m_window_index,m_tab_index,content_pad,content_y+top_h+gap,content_w,bottom_h,"Composicao logica dos sinais","Bloco final para refresh, logica, candle, valor e comparacoes. Deve ser migrado apenas depois que os slots e parametros estiverem estaveis."))
         return(false);

      m_created=true;
      return(true);
     }
  };

#endif // __CONSTRUTOR_V2_TAB8_MONTAR_MAIN_VIEW_MQH__
