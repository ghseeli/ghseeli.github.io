︠472b3f0e-5443-4200-98b9-a5895be7a703i︠
%md
Symmetric Functions in SageMath
===

SageMath has a robust implementation of Symmetric Functions built in with many commonly used bases. In this tutorial, we will explore how to do basic computations with various common bases.

(As always, Shift+Enter enables you to run a computation cell.)
︡acb9bf79-3d0f-409a-81e3-382bfc1068f0︡{"done":true,"md":"Symmetric Functions in SageMath\n===\n\nSageMath has a robust implementation of Symmetric Functions built in with many commonly used bases. In this tutorial, we will explore how to do basic computations with various common bases.\n\n(As always, Shift+Enter enables you to run a computation cell.)"}
︠bc8a9f6b-9e59-4ec8-b06c-2601d02f4440si︠
%md In SageMath, you usually have to first initialize the algebraic ring/algebra you are working in.
︡1b085f1c-9de7-4dd1-8e26-c4e4e7b00b47︡{"md":"In SageMath, you usually have to first initialize the algebraic ring/algebra you are working in."}︡{"done":true}
︠2d425a07-bbe3-4f68-8f3f-cec9a46636fb︠
sym = SymmetricFunctions(QQ) # Initialize symmetric functions over the rationals
sym
︡80cbf1cc-83b7-4a84-ae8d-c4ff8fb76f7f︡{"stdout":"Symmetric Functions over Rational Field\n"}︡{"done":true}
︠8153d634-da72-4864-bd8e-d4fbc1cd8443si︠
%md Then, we need to specify a basis to work with
︡3df69de3-1242-459e-bdb9-1a5c60b75b55︡{"md":"Then, we need to specify a basis to work with"}︡{"done":true}
︠0a5b1a25-60c0-4600-94d3-716bf390cbf3︠
m = sym.m() # Monomial symmetric functions
︡c8ab9388-31df-40c5-8192-239a944ea9cc︡{"done":true}
︠39b36bb2-b4b8-4986-96ab-1e559fca8adfs︠
m.an_element()
︡d8f9df04-977f-43bc-b575-396e5f459a7f︡{"stdout":"2*m[] + 2*m[1] + 3*m[2]\n"}︡{"done":true}
︠4b1e2fd7-b9f8-43ed-b77c-d691add9ccb2si︠
%md Now, we can create arbitrary finite linear combinations of monomial symmetric functions!
︡db746556-0f4b-481d-bda3-1e275b96ccf0︡{"md":"Now, we can create arbitrary finite linear combinations of monomial symmetric functions!"}︡{"done":true}
︠2580b49d-7a3d-4b01-9afb-adf0f3ef1349s︠
m[2]+2*m[1,1]
︡df6ff480-22f5-44e9-937d-6e29ff650b8a︡{"stdout":"2*m[1, 1] + m[2]\n"}︡{"done":true}
︠ff70e5e9-0bb1-4922-8997-5bb2aac3197bs︠
m[1]*m[2]
︡92091d77-50b5-48b3-a574-3594e63f2592︡{"stdout":"m[2, 1] + m[3]\n"}︡{"done":true}
︠cd4f8ffb-ee0c-4701-909b-d1483c08542bs︠
(m[2]+m[3])*(m[1]+m[2])
︡4a1430d2-9f86-4f0e-bb0c-5dd81e8b1cb7︡{"stdout":"m[2, 1] + 2*m[2, 2] + m[3] + m[3, 1] + m[3, 2] + 2*m[4] + m[5]\n"}︡{"done":true}
︠49510b79-0841-4ae9-a098-8ced9c010f8fsi︠
%md You can also expand a symmetric function in terms of variables
︡6157dab0-eb41-46d7-bf12-1aa3eca4590e︡{"md":"You can also expand a symmetric function in terms of variables"}︡{"done":true}
︠f26afc4e-b8a8-415a-94fc-aabeebbfa6dcs︠
m[3,1].expand(3) # Expand in terms of three variables: x0, x1, x2
︡5e5c3982-14fd-4bec-a17e-d4ede55ed9d6︡{"stdout":"x0^3*x1 + x0*x1^3 + x0^3*x2 + x1^3*x2 + x0*x2^3 + x1*x2^3\n"}︡{"done":true}
︠b8aca853-c606-4c38-b7b4-e3023dddb8a5si︠
%md Now, there are many other bases you may want to use. Luckily, Sage has many of them implemented!
︡f1bd58e4-bf73-44b5-bd3b-a110fa4fbb4b︡{"md":"Now, there are many other bases you may want to use. Luckily, Sage has many of them implemented!"}︡{"done":true}
︠7bea0d39-4529-4419-be82-c65792046b20s︠
h = sym.h() # Complete homogeneous symmetric functions
e = sym.e() # Elementary symmetric functions
s = sym.s() # Schur functions
p = sym.p() # Powersum symmetric functions
︡9ed686e2-96b8-4b24-a26a-4c863c449164︡{"done":true}
︠cbbb10cb-6e5a-428a-a7f7-65d3782bab9asio︠
%md Now, these bases will work just like the monomial symmetric functions
︡4ad811fa-a29b-4b1f-940d-d97af876ee16︡{"md":"Now, these bases will work just like the monomial symmetric functions"}︡{"done":true}
︠08a567bc-4ad3-4084-b2c3-f184312725c2s︠
e[2]*e[1], e[4,2]+e[5,1], h[2]*h[1], h[3,2]+h[4,1], s[1]*s[3], s[3,2]+s[4,1]
︡e30e8834-852a-484d-a6f4-a41f099cac6e︡{"stdout":"(e[2, 1], e[4, 2] + e[5, 1], h[2, 1], h[3, 2] + h[4, 1], s[3, 1] + s[4], s[3, 2] + s[4, 1])\n"}︡{"done":true}
︠c5cb18d8-b1a3-4b50-b848-9e3a9bee3533i︠
%md
_Exercise_ Try seeing what happens when you multiply elements from two different bases together. For instance, try $e_{2,1}*h_{2,1}$ and also try $h_{2,1}*e_{2,1}$.
︡52886b74-6c43-44b5-b796-7f01b9aed38e︡{"done":true,"md":"_Exercise_ Try seeing what happens when you multiply elements from two different bases together. For instance, try $e_{2,1}*h_{2,1}$ and also try $h_{2,1}*e_{2,1}$."}
︠07d57926-7ba1-4529-97d3-5b72b4450478︠

︡917d1e71-ae82-4868-9def-44591a6c5a2d︡
︠59fb24da-b974-4eb4-90b7-0ee0384f83c2si︠
%md You can convert elements from one basis to another by wrapping the term you have in the other basis. This process is called *coercion* in SageMath.
︡30f3e8ed-eac5-4e22-b3e9-50aa0a557e40︡{"md":"You can convert elements from one basis to another by wrapping the term you have in the other basis. This process is called *coercion* in SageMath."}︡{"done":true}
︠bf9079fa-fbd0-4ac8-a571-a4f8e37a5b30s︠
h(s[2,1])
︡e1c494ad-da68-4161-8cc4-32dbac1acf8b︡{"stdout":"h[2, 1] - h[3]\n"}︡{"done":true}
︠5e37c3a6-fe78-4fc9-be1e-128faf0c014es︠
s(h[2,1]-h[3])
︡7bb7143b-f611-47df-bbea-db15c415c462︡{"stdout":"s[2, 1]\n"}︡{"done":true}
︠04578dc6-89cb-422a-9bc8-3feee7b199c3si︠
%md Also, one can compute the Hall scalar product of symmetric functions
︡46d43d7d-6969-45d2-a0c4-c34a79cbac27︡{"md":"Also, one can compute the Hall scalar product of symmetric functions"}︡{"done":true}
︠f9264c27-5c32-44d5-ba60-2849b7fcb30bs︠
f = s[2,1]
g = s[1,1,1]
︡3a3c6769-66b2-44b9-997a-4a2dfb2e3e5d︡{"done":true}
︠0a46ce13-963a-4ffd-9ad2-8ac4213ec2a2s︠
f.scalar(g)
︡1e7db40b-7d89-480b-a90a-ff6286bc010e︡{"stdout":"0\n"}︡{"done":true}
︠2bc296ed-167b-4266-a75a-6ced82fe89f4s︠
f.scalar(f)
︡46b198ea-044c-42ab-9003-f67ad7c637ac︡{"stdout":"1\n"}︡{"done":true}
︠3fb93bac-bbf4-4650-a26d-753a5e8eec7bsi︠
%md We verify the Schur functions are orthonormal in degree 3
︡f9dbf4ae-69d0-47fd-ac38-249fcd14820c︡{"md":"We verify the Schur functions are orthonormal in degree 3"}︡{"done":true}
︠2a60ba74-8238-4f3b-a65f-1b046ea3c8c5s︠
table = [[f1.scalar(f2) for f2 in s.basis(3)] for f1 in s.basis(3)]
matrix(QQ,table)

︡62b9f255-5c3d-4d27-a4cd-edd5c3e3cb93︡{"stdout":"[1 0 0]\n[0 1 0]\n[0 0 1]\n"}︡{"done":true}
︠70e16566-ed3a-4f56-81a5-2c5b0f5c710dsi︠
%md The $\omega$-involution is also implemented!
︡cb45cd32-1f93-4b1e-a2bd-6102fb679d95︡{"md":"The $\\omega$-involution is also implemented!"}︡{"done":true}
︠841fe3c3-cb9f-45c2-a1ad-6432bcfdf2c4s︠
f.omega()
︡fbc0118b-5f76-48b9-a276-3b9808f1da28︡{"stdout":"s[2, 1]\n"}︡{"done":true}
︠0006ec31-9dad-461a-a2f2-3f6411bc533as︠
h21_omega = (h[2,1]).omega()
h21_omega
︡66e42634-7adc-4ba0-ae91-ae1e16d42d90︡{"stdout":"h[1, 1, 1] - h[2, 1]\n"}︡{"done":true}
︠86fc7ca7-e08f-4932-aebf-ccec0fb0303bs︠
e(h21_omega)
︡ea5ecd54-2351-4552-b33c-be770b1e7759︡{"stdout":"e[2, 1]\n"}︡{"done":true}
︠4a1183c4-2cb0-4a40-b8c0-105244a27305si︠
%md SageMath has many other operations for symmetric functions implemented, such as skewing, plethysm, and more! You can check out a more comprehensive tutorial [here](https://doc.sagemath.org/html/en/reference/combinat/sage/combinat/sf/sf.html#sage.combinat.sf.sf.SymmetricFunctions)!
︡ec3d5378-15bd-4307-b29f-a56490f460e8︡{"md":"SageMath has many other operations for symmetric functions implemented, such as skewing, plethysm, and more! You can check out a more comprehensive tutorial [here](https://doc.sagemath.org/html/en/reference/combinat/sage/combinat/sf/sf.html#sage.combinat.sf.sf.SymmetricFunctions)!"}︡{"done":true}
︠4607f859-7508-45b7-b708-8a4d7985d202︠









