package com.caesarjlee.backend.cms.securities;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/*
    # BCrypt

    ## basic info:

    * created time:     1999
    * creators:	        Niels Provos, David Mazières
    * type:             password hashing algorithm
    * output format
        ```
            $2a$12$R9h/cIPz0gi.URNNX3kh2OPST9/PgBkqquzi.Ss7KIUgO2t0jWMUW
            \__/\/ \____________________/\_____________________________/
            Alg Cost      Salt                        Hash
        ```
        $2<type>$<cost>$<22-char salt><31-char hash>
            * algorithm type
                1. `2`: original
                2. `2a`: most common and widely used, Spring Security default
                3. `2x`: bug fixes to `2a`
                4. `2y`: another bug fixes version to `2a`
                5. `2b`: current standard (recommended)
            * cost
                * integer between 4 and 31
                * control the number of hashing round as ${2}^{cost}$
            * password
                * max capacity: 72 characters
                * longer password will be truncated (cut off)

    ## term

    1. `salt`:          a random 128-bit (16 bytes) value added to the password before hashing, which used to prevent precomputed attack (e.g. rainbow table)
    2. `rainbow table`: a type of brutal-force attack using a precomputed table of hashed values
    3. `cost`:          define computational difficulty, the higher cost, the more time spend to encrypt, the more secure

    ### algorithm thoughts

    1. generate a cryptographically secure random salt
    2. hash the password using `EKSBlowfish` algorithm (a variant of Blowfish with expensive key)
    3. turncate or pad the result to produce a fixed-length 31-char hash
    4. format and return the final result

    ### pros and cons

    * pros
        1. build-in `salting` to resist rainbow tables
        2. adjustable `cost factor` slows down brute-force attacks over time
        3. well-tested and widely adopted in frameworks
        4. resistant to hardware attack
    * cons
        1. passwords longer than 72 characters are silently truncated
        2. relatively slower than modern algorithms like `Argon2` or `scrypt`
        3. not ideal for hashing huge data or files
        4. no built-in protection against `side-channel attacks`

    ### tips

        1. use `org.springframework.security.crypto.bcrypt.BCryptPasswordEncode`
        2. don't use custom salt-BCrypt method
        3. set a `salt` that's slow enough to block brutal-force but fast enough for users (e.g. 12 -> ~100-300 ms for users)
        4. prefer use `2b` for better compatibility and fixes
*/
@Configuration
public class passwordEncoderConfiguration {
    @Bean
    public PasswordEncoder passwordEncoder(){
        //use BCryptPasswordEncoder
        //return new BCryptPasswordEncoder();//default: type: 2a, cost: 10
        return new BCryptPasswordEncoder(
                BCryptPasswordEncoder.BCryptVersion.$2B,//use 2b version
                12,//cost is 12
                null//use default random number generator
        );
    }
}