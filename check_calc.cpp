#include <iostream>
#include <string>
#include <algorithm>

int main()
{
	std::string str;
	int i = 0;
	std::string sstr;
	long sum = 0;
	long _hvalue;

	while (1)
	{
		getline(std::cin, str);
		str.erase(remove(str.begin(), str.end(), ' '), str.end());
		std::cout << "��ȡ�����ַ���Ϊ:" << str << std::endl;
		std::cout << "����Ϊ:" << str.size() << std::endl;
		while (i <= str.size())
		{
			sstr = str.substr(i, 2);
			_hvalue = strtol(sstr.c_str(), NULL, 16);
			sum += _hvalue;
			i = i + 2;
		}
		printf("���Ϊ::%x\n",sum);
		str = "";
		i = 0;
		sum = 0;
		_hvalue = 0;
		getchar();
		system("cls");
	}
	system("pause");
	return 0;
}