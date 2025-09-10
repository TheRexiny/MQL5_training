//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
   {}

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {}



void get_MqlRates_structure(string pSymbol, ENUM_TIMEFRAMES pPeriod, int pGap, int pQuantity, MqlRates &pContainer[])
{
 /* 
   MqlRates is a structure that is used to store infomation like:
         datetime time;         // hora del inicio del período
         double   open;         // precio de apertura
         double   high;         // precio máximo durante el período
         double   low;          // precio mínimo durante el período
         double   close;        // precio de cierre
         long     tick_volume;  // volumen de tick
         int      spread;       // spread
         long     real_volume;  // volumen de stock
    Once you have a MqlRates you could access to each value usin .time, .open, .close ... to get
    the infmormation in the structure.

    Function CopyRates() gets the MqlRates structures of a determinated number on candels:

      bool  matrix::CopyRates( 
         string           symbol,       // nombre del símbolo 
         ENUM_TIMEFRAMES  period,       // periodo 
         ulong            rates_mask,   // combinación de banderas para indicar las series solicitadas 
         ulong            start,        // número de la barra inicial desde la que comenzaremos a copiar  
         ulong            count         // cuántas copiaremos 
         );
   
   You must have a vaiable with the type MqlRates to store the MqlRates for exmple "MqlRates info_velas[];"
   with it you can add this valiable as the last parameter of the function (pContainer) 
 */
 CopyRates(pSymbol,pPeriod,pGap,pQuantity,pContainer);
}  

vector get_prices_only (string pSymbol, ENUM_TIMEFRAMES pPeriod, ENUM_COPY_RATES pIdentifier, int pGap, int pQuantity)
{
 /*
   In this case you will fill a vector with a specific type of value inside MqlRates, for example you
   could fill the vector with the close prices,high prices o whatever in MqlRates structure, to do that
   you must use the identifier like COPY_RATES_OPEN, COPY_RATES_HIGH, COPY_RATES_LOW ....
 */
vector test_vector;
test_vector.CopyRates(pSymbol,pPeriod,pIdentifier,pGap ,pQuantity); 
return test_vector;

}