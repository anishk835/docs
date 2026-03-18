# Spring Framework Documentation

Comprehensive guides for Spring Framework, Spring Security, and testing.

## 📖 Contents

### [Spring Security in Detail](../spring-security.md)
Complete guide to Spring Security architecture and implementation:

#### 🏗️ Architecture Overview
- **UserDetails** → User information container
- **UserDetailsManager** → User management (InMemory, JDBC, Custom)
- **UserDetailsService** → Load user by username
- **AuthenticationProvider** → Authentication mechanism (DAO, Custom)
- **AuthenticationManager** → Coordinates multiple providers
- **Filters** → Pre-process requests before dispatcher

#### 🔐 Security Flow
```
HTTP Request → Filter Chain → Authentication Filter
→ Authentication Manager → Authentication Provider
→ UserDetailsService → Database/LDAP/Memory
→ SecurityContext (store authenticated user)
```

#### 🛠️ Key Configuration

**Web Security (Deprecated WebSecurityConfigurerAdapter):**
```java
@EnableWebSecurity
public class SecurityConfig {
    @Bean
    protected SecurityFilterChain filterChain(HttpSecurity http) {
        return http
            .authenticationProvider(customAuthProvider)
            .addFilterAfter(new CustomFilter(), UsernamePasswordAuthenticationFilter.class)
            .authorizeRequests().anyRequest().authenticated()
            .and().build();
    }
}
```

**Custom Authentication Provider:**
```java
@Component
public class CustomAuthProvider implements AuthenticationProvider {
    @Override
    public Authentication authenticate(Authentication auth) {
        // Custom authentication logic
        return new CustomAuthenticationType();
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(CustomAuthenticationType.class);
    }
}
```

#### 📊 Diagrams Included
- Spring Security architecture flow
- Authentication Manager flow
- UsernamePasswordAuthenticationFilter implementation
- ProviderManager scanning mechanism

---

### [Migration JUnit 4 to JUnit 5](../migration-junit4-to-5.md)
Complete migration guide from JUnit 4 to JUnit 5:

#### 🏛️ Architecture
**JUnit 5 = Platform + Jupiter + Vintage**

- **JUnit Platform**: Foundation for launching testing frameworks on JVM
- **JUnit Jupiter**: New programming model and extensions
- **JUnit Vintage**: Backward compatibility for JUnit 3/4 tests

#### 🔄 Migration Steps

**1. Update Dependencies:**
```xml
<!-- JUnit 5 -->
<dependency>
    <groupId>org.junit.jupiter</groupId>
    <artifactId>junit-jupiter</artifactId>
    <version>5.x.x</version>
    <scope>test</scope>
</dependency>

<!-- Mockito for JUnit 5 -->
<dependency>
    <groupId>org.mockito</groupId>
    <artifactId>mockito-junit-jupiter</artifactId>
    <version>${mockito.version}</version>
    <scope>test</scope>
</dependency>

<!-- For mocking static/final/constructor -->
<dependency>
    <groupId>org.mockito</groupId>
    <artifactId>mockito-inline</artifactId>
    <version>${mockito.version}</version>
    <scope>test</scope>
</dependency>
```

**2. Update Annotations:**
```java
// JUnit 4                    →  JUnit 5
@RunWith(MockitoJUnitRunner) → @ExtendWith(MockitoExtension.class)
@Before                      → @BeforeEach
@After                       → @AfterEach
@BeforeClass                 → @BeforeAll
@AfterClass                  → @AfterAll
@Ignore                      → @Disabled
```

#### 🧪 Testing Annotations

- **@Mock**: Create mock objects
- **@Spy**: Spy on real objects
- **@InjectMocks**: Inject mocks into tested class
- **@Captor**: Capture argument values
- **@ExtendWith**: Replace @RunWith

#### ⚙️ Maven Surefire Plugin
```xml
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-surefire-plugin</artifactId>
    <version>2.22.2</version>
</plugin>
```

---

### [Memory Efficient Java Code](../java/memory-efficient.md)
Java memory optimization and GC tuning:

#### 💾 Memory Efficiency Tips

**1. Primitive vs. Boxed Types**
```java
// BAD: Integer creates 4x size on 32-bit OS
Integer i = new Integer(10);  // 128 bits

// GOOD: Use primitive
int i = 10;  // 32 bits
```

**2. String vs. Char**
```java
// BAD: String creates char array + overhead
String s = "A";

// GOOD: Use char for single character
char c = 'A';
```

**3. Collection Choice**
- Use right collection for use case
- Consider memory footprint vs. performance
- Enable compressed object references on 64-bit OS

#### 🗑️ Garbage Collection

**Heap Size Tuning:**
- Smaller heap = frequent GC (performance impact)
- Larger heap = longer full GC pauses
- Target: < 5% execution time in GC

**GC Metrics:**
- Allocation rate
- Heap population
- Mutation rate
- Object lifespan
- Mark time / Compaction time

**Sweeping Methods:**
1. Normal sweep
2. Sweep with compacting
3. Sweep with copying

#### 🚫 Avoid Memory Leaks

1. Set objects to null when done
2. Close resources (streams, connections)
3. Use StringBuilder instead of String concatenation
4. Be careful with static collections
5. Override `hashCode()` and `equals()` for custom objects in HashSet

---

## 🔗 Related Documents

- [Blogs & References](../blogs.md) - Spring Data JPA performance articles
- [Dev Setup Issues](../dev-setup-issues-fix-notes.md) - Maven super POM

---

## 💡 Best Practices

### Spring Security
1. **Never skip security updates** - Keep dependencies current
2. **Use method security** - Add `@PreAuthorize`, `@PostAuthorize`
3. **CSRF protection** - Enable for state-changing operations
4. **Password encoding** - Use BCrypt or Argon2
5. **Custom filters** - Extend `OncePerRequestFilter` for custom logic

### Testing
1. **Avoid PowerMock** - Use mockito-inline for static/final mocking
2. **Use `@Spy` sparingly** - Prefer pure mocks
3. **Test behavior, not implementation** - Focus on public API
4. **Parameterized tests** - Use `@ParameterizedTest` in JUnit 5
5. **Maven test phases** - JUnit in test, integration tests in verify

### Memory Management
1. **Profile before optimizing** - Use profilers (VisualVM, JProfiler)
2. **Right collection type** - ArrayList vs. LinkedList vs. HashSet
3. **Avoid premature optimization** - Profile first
4. **GC logging** - Enable for production monitoring
5. **Heap dumps** - Analyze with MAT (Memory Analyzer Tool)

---

## 📚 Additional Resources

**Spring Security:**
- [Official Documentation](https://docs.spring.io/spring-security/reference/)
- [Spring Security Architecture](https://spring.io/guides/topicals/spring-security-architecture/)

**JUnit 5:**
- [User Guide](https://junit.org/junit5/docs/current/user-guide/)
- [Migration Guide](https://junit.org/junit5/docs/current/user-guide/#migrating-from-junit4)

**Java Performance:**
- [Java Performance Tuning Guide](https://docs.oracle.com/javase/8/docs/technotes/guides/vm/gctuning/)

---

*Part of [Technical Documentation Repository](../README.md)*
