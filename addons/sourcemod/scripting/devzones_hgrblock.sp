// ------ #include ------ //

#include <sourcemod>
#include <devzones>
#include <multicolors>
#include <hgr>

// ------ int ------ //

int Hgrblock[MAXPLAYERS + 1];

// ------ #pragma ------ //

#pragma semicolon 1
#pragma newdecls required

// ------ myinfo ------ //

public Plugin myinfo = 
{
	name = "SM DEV ZONES - HGR Block",
	author = "ByDexter",
	description = "",
	version = "1.0",
	url = "https://steamcommunity.com/id/ByDexterTR/"
};

public void OnClientDisconnect(int client)
{
	if (Hgrblock[client] == 1)
	{
		Hgrblock[client] = 0;
	}
}

public void Zone_OnClientEntry(int client, const char[] zone)
{
	if(client < 1 || client > MaxClients || !IsClientInGame(client) ||!IsPlayerAlive(client)) 
		return;
		
	if(StrContains(zone, "hgrblock", false) == 0)
	{
		Hgrblock[client] = 1;
		CPrintToChat(client, "{darkred}[ByDexter] {green}hgrblock Bölgesine {default}girdiniz.");
	}
}

public void Zone_OnClientLeave(int client, const char[] zone)
{
	if(client < 1 || client > MaxClients || !IsClientInGame(client) ||!IsPlayerAlive(client)) 
		return;
		
	if(StrContains(zone, "hgrblock", false) == 0)
	{
		Hgrblock[client] = 0;
		CPrintToChat(client, "{darkred}[ByDexter] {green}hgrblock Bölgesinden {default}ayrıldınız.");
	}
}

public Action HGR_OnClientHook(int client)
{
	if (Hgrblock[client] == 1)
	{
		CPrintToChat(client, "{darkred}[ByDexter] {green}Bu bölgede {default}hook kullanamazsın");
		return Plugin_Handled;
	}
	return Plugin_Continue;
}

public Action HGR_OnClientGrab(int client)
{
	if (Hgrblock[client] == 1)
	{
		CPrintToChat(client, "{darkred}[ByDexter] {green}Bu bölgede {default}grab kullanamazsın");
		return Plugin_Handled;
	}
	return Plugin_Continue;
}

public Action HGR_OnClientRope(int client)
{
	if (Hgrblock[client] == 1)
	{
		CPrintToChat(client, "{darkred}[ByDexter] {green}Bu bölgede {default}rope kullanamazsın");
		return Plugin_Handled;
	}
	return Plugin_Continue;
}