# to check the certificate
>shell
cd /nsconfig/ssl
ls -l | grep 2022
exit
# To update the certificate
update SSL Certkey xyz.domain.com_2022 -cert xyz.domain.com_2022.pfx -key xyz.domain.com_2022.pfx -inform PFX -password XXXXXX

update ssl certkey xyz.domain.com_2022 -cert xyz.domain.com_2022.pfx -key xyz.domain.com_2022.pfx -inform -password XXXXXX
show certkey xyz.domain.com_2022
save nsconfig
